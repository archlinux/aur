# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=tulip
pkgver=5.3.0
pkgrel=1
pkgdesc='Tulip is an information visualization framework dedicated to the analysis and visualization of relational data.'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://tulip.labri.fr/'
license=('GPL')
depends=(
    'qt5-base'
    'libjpeg'
    'libpng'
    'zlib'
    'glew'
    'libxml2'
    'freetype2'
    'qhull'
    'quazip'
    'yajl'
    'python'
    'desktop-file-utils'
    'qt5-webkit'
    )
makedepends=(
    'cmake'
    'cppunit'
    'sip'
    )
optdepends=(
    'doxygen'
    'python-sphinx'
    )
source=(
    "https://sourceforge.net/projects/auber/files/tulip/tulip-${pkgver}/tulip-${pkgver}_src.tar.gz"
    )
sha256sums=('a863ee21877fe0181ef5c9fa215f27ba1b8773fc3d945e23c323d7ff0f0db60b')

prepare()
{
    cd "${pkgname}-${pkgver}"

    mkdir -p build && cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DTULIP_BUILD_TESTS=ON \
        -DBUILD_SHARED_LIBS=ON \
        ..
}

build()
{
    cd "${pkgname}-${pkgver}/build"
    make
}

check()
{
    cd "${pkgname}-${pkgver}/build"
    make test
}

package()
{
    cd "${pkgname}-${pkgver}/build"

    make DESTDIR="${pkgdir}" install
}
