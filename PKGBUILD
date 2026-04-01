# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=CAZADOR
_dist=MooX-Log-Any
pkgname=perl-${_dist@L}
pkgver=0.004004
pkgrel=1
pkgdesc='Role to add Log::Any'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-log-any'
    'perl-moo'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-io'
    'perl-log-any'
    'perl-moo'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.6.0'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('2a1afa0f3a411e28a9258ccabe2c5b5d647abc29f2fbf5be9ffaf2286e830534')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
