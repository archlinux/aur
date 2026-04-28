pkgname=qt-img-viewer
pkgver=0.1.0
pkgrel=1
pkgdesc='Qt 6 image viewer with directory thumbnails, animated GIF playback, and image-only floating mode'
arch=('x86_64')
url='https://github.com/jswysnemc/qt-img-viewer'
license=('MIT')
depends=('qt6-base' 'qt6-imageformats' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3bbe2051d59c7cab4df2eac113099784159b955d377ad543e4840dc8b9284325')

build() {
    cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
