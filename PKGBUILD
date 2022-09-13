# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=tulip
pkgver=5.6.3
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
sha256sums=('741d411348eb917ab8cd5cd481573217d43efaf32c0535c7ebab24792ed417be')

build()
{
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DTULIP_BUILD_TESTS=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

#check() {
    #cmake --build "build-$pkgver" -t test
    # fails with:
    # CMake Error at …/build-5.6.1/thirdparty/sip-4.19.25/siplib/cmake_install.cmake:60 (file):
    # file cannot create directory: /usr/lib/tulip/python/tulip/native.  Maybe
    # need administrative privileges.
#}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
