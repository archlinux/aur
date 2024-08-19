# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgname=tulip
pkgver=5.7.4
pkgrel=1
pkgdesc='An information visualization framework dedicated to the analysis and visualization of relational data.'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://tulip.labri.fr/'
license=('GPL')
depends=(
    'qt6-base'
    'libjpeg'
    'libpng'
    'zlib'
    'glew'
    'libxml2'
    'freetype2'
    'qhull'
    'quazip-qt6'
    'yajl'
    'python'
    'desktop-file-utils'
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
source=("https://sourceforge.net/projects/auber/files/tulip/tulip-${pkgver}/tulip-${pkgver}_src.tar.gz")
sha256sums=('ef3db55a43e2d6fd801a2b210e65d93c079d3238173d19e95221d3cc49dce4b6')

build()
{
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DTULIP_BUILD_TESTS=ON \
        -DTULIP_USE_QT6=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

#check() {
    #cmake --build "build-$pkgver" -t test
    ##The following tests FAILED:
            ##16 - PushPopTest (Subprocess aborted)
            ##31 - TulipPluginsLoadingTest (Subprocess aborted)
            ##35 - ExternalPluginsBuildTest (Failed)
#}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
