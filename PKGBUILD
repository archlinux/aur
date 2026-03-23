# Maintainer: Schmoho

pkgname=zotero-db-cli
_distname=zotero_cli
pkgver=0.1.0
pkgrel=2
pkgdesc="Read-only CLI for querying Zotero client SQLite metadata and PDF annotation positions"
arch=('any')
url="https://github.com/decent-tools-for-thought/zotero-cli"
license=('0BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_distname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver.tar.gz")
sha256sums=('9afd579ab709a96432ec17b1a79e3f009e1bbd2d9535b8cd176aa8a5595b1c81')

build() {
  cd "$srcdir/$_distname-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_distname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
