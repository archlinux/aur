# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

pkgname=notesearch-rag
_pkg=notesearch-rag
pkgver=0.1.0
pkgrel=1
pkgdesc='Hybrid dense + BM25 search over markdown memory notes, as a CLI and an MCP server (Claude Code, LM Studio)'
arch=('any')
url='https://github.com/JSkier21/notesearch-rag'
license=('MIT')
depends=('python' 'python-numpy' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef7d160e3efb7afc682f18f108bb36b3841722e67f1daa629b6d8ff077cd6a4b')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"
  PYTHONPATH=src python -m unittest discover -s tests
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
