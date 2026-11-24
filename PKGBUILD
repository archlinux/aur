# Maintainer: sfnemis <sfnemis@linnote.app>
pkgname=linnote
pkgver=2.0.1
pkgrel=1
pkgdesc="A fast, keyboard-driven scratchpad for Linux with smart calculator, OCR, timers, and 14+ themes"
arch=('x86_64' 'aarch64')
url="https://linnote.app"
license=('MIT')
depends=(
    'qt6-base'
    'openssl'
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/sfnemis/linnote/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('335ae794d9a082f4510cf7619097e18b967a86f206cf1355d7d21444c3129fea')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
