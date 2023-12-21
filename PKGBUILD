pkgname=python-tree-sitter
pkgver=0.20.4
pkgrel=2
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
  "https://pypi.io/packages/source/t/tree_sitter/tree_sitter-$pkgver.tar.gz"
  'LICENSE'
)
sha256sums=(
  '6adb123e2f3e56399bbf2359924633c882cc40ee8344885200bca0922f713be5'
  SKIP
)

build() {
  cd "$srcdir/tree_sitter-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/tree_sitter-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
