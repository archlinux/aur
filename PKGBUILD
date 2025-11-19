# Maintainer: pierspad
pkgname=textmerger
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python GUI application for merging text files"
arch=('any')
url="https://github.com/pierspad/textmerger"
license=('MIT')

depends=(
  'python'
  'python-pyqt5'
  'python-flask'
  'python-werkzeug'
)

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    'python-nbformat: for Jupyter Notebook support'
    'python-pypdf2: for PDF support'
)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pierspad/textmerger/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('c5d4e0b816b347c3fb6ca15e3878af91f60eee6bd85bf6d16707c5adda4a6a5c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Install desktop file
  install -Dm644 packaging/textmerger.desktop "$pkgdir/usr/share/applications/textmerger.desktop"
  
  # Install icon
  install -Dm644 textmerger/assets/logo/logo.png "$pkgdir/usr/share/pixmaps/textmerger.png"
  
  # Install docs and license
  install -Dm644 docs/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
