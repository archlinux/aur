# Maintainer: pierspad
pkgname=textmerger
pkgver=1.2.1
pkgrel=3
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
sha256sums=('cf96439171d66b7ee6f2fb2cac5bb1047b29cf76942c3172d99aad04b419a1b0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python -m build --wheel
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Install desktop file
  install -Dm644 packaging/textmerger.desktop "$pkgdir/usr/share/applications/textmerger.desktop"
  
  # Install icon
  install -Dm644 textmerger/assets/logo/logo.png "$pkgdir/usr/share/pixmaps/textmerger.png"
  
  # Install docs and license
  install -Dm644 docs/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
