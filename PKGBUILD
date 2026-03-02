# Maintainer: Daniel Korbelainen <officialpand@gmail.com>
pkgname=sniptext
pkgver=0.2.0
pkgrel=1
pkgdesc="Screen text extractor with OCR and spell correction"
arch=('any')
url="https://github.com/dkorbelainen/sniptext"
license=('MIT')
install=sniptext.install
depends=(
    'python'
    'python-numpy'
    'python-pillow'
    'python-pynput'
    'python-pyyaml'
    'python-loguru'
    'python-pytesseract'
    'tesseract'
    'tesseract-data-eng'
    'libnotify'
)
optdepends=(
    'python-symspellpy: Spell correction for English text'
    'python-scikit-learn: Adaptive OCR quality analysis'
    'tesseract-data-rus: Russian language support'
    'tesseract-data-ell: Greek language support'
    'tesseract-data-equ: Mathematical equations and symbols'
    'tesseract-data-fra: French language support'
    'tesseract-data-deu: German language support'
    'tesseract-data-spa: Spanish language support'
    'tesseract-data-jpn: Japanese language support'
    'tesseract-data-chi_sim: Chinese Simplified support'
    'slurp: Wayland region selection'
    'grim: Wayland screenshots'
    'wl-clipboard: Wayland clipboard'
    'maim: X11 screenshots'
    'xclip: X11 clipboard'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a10382e1818f751ed0b0375e3d4a7c86a31cdb10c24a3334d9e42becf9085f82')

build() {
    cd "$pkgname-$pkgver"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # Install only our wheel; rely on system/python deps from depends()
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install desktop entry
    install -Dm644 sniptext.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
