pkgname=python-tree-sitter
pkgver=0.22.2
pkgrel=3
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
  '83b1e625c1e4e485af4cda226605d682ecaf3445bcf36cd471bad103f7b0df8b'
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
