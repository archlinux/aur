# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=SHLOMIF
_dist=Graph-Easy-As_svg
pkgname=perl-${_dist@L}
pkgver=0.28
pkgrel=2
pkgdesc='Output a Graph::Easy as Scalable Vector Graphics (SVG)'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('GPL-2.0-only')
depends=(
    'perl-graph-easy'
    'perl-image-info>=1.28'
    'perl-test-simple'
    'perl>=5.10.0'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-module-build>=0.28'
)
checkdepends=(
    'perl-io'
    'perl-lib'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('cd9a5fac44442f34b3379081e86c2f714004e539246006c98141116cbf3e2778')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
