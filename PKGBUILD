pkgname=qt-img-viewer
pkgver=0.1.2
pkgrel=1
pkgdesc='Qt 6 image viewer with directory thumbnails, animated GIF playback, and image-only floating mode'
arch=('x86_64')
url='https://github.com/jswysnemc/qt-img-viewer'
license=('MIT')
depends=('qt6-base' 'qt6-imageformats' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1d0f5fc16a39a2872fb02d616a7b167b5db989b2c5cb5aa9050088582d5c255c')

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
