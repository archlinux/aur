pkgname=python-tree-sitter
pkgver=0.25.1
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
  'python-setuptools'
  'python-wheel'
  'python-installer'
)
source=(
  "https://pypi.io/packages/source/t/tree-sitter/tree-sitter-$pkgver.tar.gz"
  'LICENSE'
)
sha256sums=(
  'cd761ad0e4d1fc88a4b1b8083bae06d4f973acf6f5f29bbf13ea9609c1dec9c1'
  SKIP
)

build() {
  cd "$srcdir/tree-sitter-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/tree-sitter-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
