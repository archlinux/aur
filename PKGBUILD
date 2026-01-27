# Maintainer: Daniel Korbelainen <officialpand@gmail.com>
pkgname=sniptext
pkgver=0.1.2
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
    'python-scikit-learn: Advanced confidence modeling for ensemble OCR'
    'tesseract-data-rus: Russian language support'
    'tesseract-data-fra: French language support'
    'tesseract-data-deu: German language support'
    'tesseract-data-spa: Spanish language support'
    'tesseract-data-jpn: Japanese language support'
    'tesseract-data-chi_sim: Chinese Simplified language support'
    'slurp: Wayland screen selection (required for Wayland)'
    'grim: Wayland screenshot tool (required for Wayland)'
    'wl-clipboard: Wayland clipboard support (required for Wayland)'
    'maim: X11 screenshot tool'
    'scrot: X11 screenshot tool'
    'xclip: X11 clipboard support'
    'imagemagick: X11 screenshot tool (import command)'
)
# Note: For enhanced spell correction, install: yay -S python-symspellpy
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5cd0fe35e186405e24aad46d9ba33c7783b222d4f83b1a6400f2a36e057d66d9')

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
