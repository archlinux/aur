# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=TEAM
_dist=Protocol-SOCKS
pkgname=perl-${_dist@L}
pkgver=0.003
pkgrel=1
pkgdesc='abstract SOCKS protocol support'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-future>=0.29'
    'perl-parent'
    'perl-socket>=2.000'
)
makedepends=(
    'perl-extutils-makemaker>=6.48'
    'perl>=5.10.1'
)
checkdepends=(
    'perl-io'
    'perl-pathtools'
    'perl-test-checkdeps>=0.010'
    'perl-test-fatal>=0.010'
    'perl-test-refcount>=0.07'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('f1a9e2e3807884db2c6bcfaa24b140d5ef45c4075f039abb915a471918fe3718')

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
