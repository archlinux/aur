pkgname=python-tree-sitter
pkgver=0.21.0
pkgrel=1
pkgdesc='Python bindings to the tree-sitter parsing library'
arch=('x86_64')
url='https://github.com/tree-sitter/py-tree-sitter'
license=('MIT')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
)
source=(
  "https://pypi.io/packages/source/t/tree-sitter/tree-sitter-$pkgver.tar.gz"
  'LICENSE'
)
sha256sums=(
  'c74ec9eff30e0c5b9f00ee578cca64df322b9885c8a15364a2c537f485abcc77'
  SKIP
)

build() {
  cd "$srcdir/tree-sitter-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/tree-sitter-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
