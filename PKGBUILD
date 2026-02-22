# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='Graph-Easy-As_svg'
pkgname='perl-graph-easy-as_svg'
pkgver=0.28
pkgrel=1
pkgdesc='Output a Graph::Easy as Scalable Vector Graphics (SVG)'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('GPL-2.0-only')
depends=(
    'perl-graph-easy>=0.63'
    'perl-image-info>1.28'
    'perl>=5.10.0'
)
makedepends=(
    'perl-module-build>=0.28'
    'perl-test-simple'
)
checkdepends=(
    'perl-io'
    'perl-lib'
    'perl-pathtools'
    'perl-test-simple'
)
source=("https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/$_dist-$pkgver.tar.gz")
options=('!emptydirs')
sha256sums=('cd9a5fac44442f34b3379081e86c2f714004e539246006c98141116cbf3e2778')

build()
{
    cd $_dist-$pkgver

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
