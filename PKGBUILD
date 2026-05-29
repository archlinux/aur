pkgname=mark-shot
pkgver=0.1.10
pkgrel=1
pkgdesc='Qt 6 Wayland screenshot selection and annotation tool'
arch=('x86_64')
url='https://github.com/jswysnemc/mark-shot'
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'layer-shell-qt' 'grim' 'wl-clipboard')
makedepends=('cmake' 'ninja')
optdepends=(
    'python: pinned-window OCR and LLM translation helpers'
    'tesseract: fallback OCR backend'
    'tesseract-data-chi_sim: simplified Chinese OCR data for tesseract'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a95e7996801082d5698e4e952a02ad6c1e7050ffb55407d0e9281fc0e760495')

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
