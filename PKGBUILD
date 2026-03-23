# Maintainer: Schmoho

pkgname=crossref-cli
_pkgname=crossref-cli
pkgver=0.1.0
pkgrel=2
pkgdesc="Crossref REST API CLI for DOI and metadata workflows"
arch=('any')
url="https://github.com/decent-tools-for-thought/crossref-cli"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('crossref-tool')
conflicts=('crossref-cli-git' 'crossref-tool')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cafa0f5925bc1eb84aeb3c85e7089ba481aa37d5146cc62935834a3d801fa705')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
