# Maintainer: Dulitha Bandaranayake <dubudeveloper@gmail.com>
pkgname=capture-text-ai
pkgver=1.3
pkgrel=1
pkgdesc="Capture image and extract text using OCR with PyQt6 GUI"
arch=('any')
url="https://github.com/DulithaBandaranayake/capture-text-ai-app"
license=('MIT')
depends=('python'
         'python-pyqt6'
         'python-pytesseract' 
         'python-pillow'
         'python-opencv'
         'python-numpy'
         'tesseract'
         'tesseract-data-eng')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DulithaBandaranayake/capture-text-ai-app/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dfe3448108110ca3e5259a60a46b5ccf6aebf396ef7a54f069ee8a90acc9f80f')

build() {
    cd "$srcdir/capture-text-ai-app-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/capture-text-ai-app-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    
    # Install desktop file (override the one from setup.py)
    install -Dm644 CaptureTextAi.desktop "$pkgdir/usr/share/applications/CaptureTextAi.desktop"
    
    # Install icons
    install -Dm644 Icon/Icon.png "$pkgdir/usr/share/pixmaps/capture-text-ai.png"
    install -Dm644 Icon/screenshot_icon.png "$pkgdir/usr/share/capture-text-ai/Icon/screenshot_icon.png"
    install -Dm644 Icon/screenshot_icon._dark.png "$pkgdir/usr/share/capture-text-ai/Icon/screenshot_icon._dark.png"
    
    # Install license
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}