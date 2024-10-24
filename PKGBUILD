pkgname=python-tree-sitter
pkgver=0.23.2
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
  '66bae8dd47f1fed7bdef816115146d3a41c39b5c482d7bad36d9ba1def088450'
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
