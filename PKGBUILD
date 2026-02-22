# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='Alien-GMP'
pkgname='perl-alien-gmp'
pkgver=1.16
pkgrel=1
pkgdesc='Alien package for the GNU Multiple Precision library'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('LGPL-3.0-only')
depends=(
    'perl-alien-build>=1.46'
    'perl>=5.6.0'
)
makedepends=(
    'perl-alien-build>=0.32'
    'perl-devel-checklib'
    'perl-extutils-cbuilder'
    'perl-extutils-makemaker>=6.52'
)
checkdepends=(
    'perl-alien-build'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_dist-$pkgver.tar.gz")
sha256sums=('090cd48ee535bf62f178895617a851783ae11aa4c6006a1fd4d84a432f113da5')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
