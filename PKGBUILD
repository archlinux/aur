# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=logfire-api
_repo='https://github.com/pydantic/logfire'
pkgname=python-$_name
pkgver=5.4.0
pkgrel=1
pkgdesc='Shim for the Logfire SDK which does nothing unless Logfire is installed.'
arch=('any')
url="$_repo/tree/main/$_name"
license=('MIT')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
source=("logfire-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c90f2aec55040ce119a9a56a49f91f62f396703d049dc993b2e644cc698e05d5')

build() {
  cd "logfire-$pkgver/$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "logfire-$pkgver/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
