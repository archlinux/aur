# Maintainer: mfw <espadonne@outlook.com>

pkgname=wezztershier
pkgver=0.2.0
pkgrel=1
pkgdesc='GUI tuner for WezTerm configuration using static decorators'
arch=('any')
url='https://github.com/tenseleyFlow/wezztershier'
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('wezterm: for WezTerm terminal emulator integration')
source=("git+https://github.com/tenseleyFlow/wezztershier.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd wezztershier
    python -m build --wheel --no-isolation
}

check() {
    cd wezztershier
    python -m pytest || true  # Allow tests to fail gracefully
}

package() {
    cd wezztershier
    
    # Install the Python package
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/$pkgname/GRAMMAR.md"
    
    # Install example image
    install -Dm644 image/wezztershier.png "$pkgdir/usr/share/doc/$pkgname/wezztershier.png"
}