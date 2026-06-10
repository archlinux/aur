pkgname=mark-shot
pkgver=0.1.25
pkgrel=1
_commit=da4917369ac139652f843df7d7ab24e9a8733198
pkgdesc='Qt 6 Wayland screenshot selection and annotation tool'
arch=('x86_64' 'aarch64')
url='https://github.com/jswysnemc/mark-shot'
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'layer-shell-qt' 'pipewire' 'grim' 'wl-clipboard')
makedepends=('cmake' 'ninja' 'pkgconf' 'git')
optdepends=(
    'python: pinned-window OCR and LLM translation helpers'
    'tesseract: fallback OCR backend'
    'tesseract-data-chi_sim: simplified Chinese OCR data for tesseract'
)
source=("${pkgname}-${pkgver}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

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
