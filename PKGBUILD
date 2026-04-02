# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ETHER
_dist=Task-Kensho-Logging
pkgname=perl-${_dist@L}
pkgver=0.41
pkgrel=1
pkgdesc='A Glimpse at an Enlightened Perl: Logging'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-log-any'
    'perl-log-contextual'
    'perl-log-dispatch'
    'perl-log-log4perl'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=(
    'perl-cpan-meta'
    'perl-json-pp'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('aa7b96eaeed3999899b2f6cbcca56e8d34380e76423c0dd795df18a831120c3d')

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
