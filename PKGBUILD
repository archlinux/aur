pkgname=mark-shot
pkgver=0.1.20
pkgrel=2
_commit=929b2d2ce42c9b4dcc22844d8c45b79e5c20b580
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
