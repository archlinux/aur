pkgname=python-tree-sitter
pkgver=0.25.2
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
  'fe43c158555da46723b28b52e058ad444195afd1db3ca7720c59a254544e9c20'
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
