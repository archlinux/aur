pkgname=python-tree-sitter
pkgver=0.26.0
pkgrel=1
pkgdesc='Python bindings to the tree-sitter parsing library'
arch=(
  'x86_64'
  'aarch64'
)
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
  "https://pypi.io/packages/source/t/tree-sitter/tree_sitter-$pkgver.tar.gz"
  'LICENSE'
)
sha256sums=(
  'b40c219edccc4564530c96f8f1556f6202b37cda964d1cbd7bd2b7e68b40a245'
  SKIP
)

build() {
  cd "$srcdir/tree_sitter-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/tree_sitter-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
