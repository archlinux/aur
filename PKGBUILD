pkgname=python-tree-sitter
pkgver=0.26.1
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
  '9919cbaf02d17fa9a4cd0e6da496aecf901b758e6eacf122eee393e3ef08aacd'
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
