# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=orthanc-plugin-web-viewer
pkgver=2.7
pkgrel=1
pkgdesc='Web viewer of medical images plugin for Orthanc'
arch=('x86_64' 'i686')
url='https://book.orthanc-server.com/plugins/webviewer.html'
license=('GPL3')

depends=(
    'orthanc'
)
makedepends=(
    'boost' 'cmake' 'gtest' 'make'
)
source=(
    "https://www.orthanc-server.com/downloads/get.php?path=/plugin-webviewer/OrthancWebViewer-${pkgver}.tar.gz"
)
sha512sums=(
    '86b08652a0216e802f2ccc93f2298b42437d3dfcf9d260d7da6920119901a61b4065fe29451a3660d64ec84a8fcd9eb18269d7b41fe1ce365b50892ea485aae2'
)

build() {
    cd OrthancWebViewer-"${pkgver}"/
    cmake \
        -DSTATIC_BUILD=OFF \
        -DALLOW_DOWNLOADS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B"${srcdir}"/build

    cd "${srcdir}"/build
    make
}

check() {
    cd "${srcdir}"/build
    ./UnitTests
}

package() {
    cd "${srcdir}"/build
    cmake --build "${srcdir}"/build --target install -- DESTDIR="${pkgdir}"
}
