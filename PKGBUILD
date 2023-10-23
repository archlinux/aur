# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-kiss-headers
_name=${pkgname#python-}
pkgver=2.4.2
pkgrel=1
pkgdesc="Python package for HTTP/1.1 style headers. Parse headers to objects."
arch=('any')
url="https://ousret.github.io/kiss-headers"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-requests')
source=("$_name-$pkgver.tar.gz::https://github.com/Ousret/kiss-headers/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1d00bc6b3d3cc33cf9534935c8c5848fbb50f850b987b62e146638a4c84cea28')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
