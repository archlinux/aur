# Maintainer: sfnemis <sfnemis@linnote.app>
pkgname=linnote
pkgver=1.0.0
pkgrel=2
pkgdesc="A fast, keyboard-driven scratchpad for Linux with smart calculator, OCR, timers, and 14+ themes"
arch=('x86_64')
url="https://linnote.app"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-svg'
    'kwindowsystem'
    'kglobalaccel'
    'layer-shell-qt'
    'tesseract'
    'tesseract-data-eng'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'git'
    'qt6-tools'
)
optdepends=(
    'tesseract-data-tur: Turkish OCR support'
    'tesseract-data-deu: German OCR support'
    'tesseract-data-fra: French OCR support'
    'tesseract-data-rus: Russian OCR support'
)
# Use main branch directly until next release tag
source=("$pkgname-$pkgver.tar.gz::https://github.com/sfnemis/linnote/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-main"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname-main"
    DESTDIR="$pkgdir" cmake --install build
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
