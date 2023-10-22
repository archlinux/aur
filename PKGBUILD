# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-kiss-headers
_name=${pkgname#python-}
pkgver=2.4.1
pkgrel=1
pkgdesc="Python package for HTTP/1.1 style headers. Parse headers to objects."
arch=('any')
url="https://ousret.github.io/kiss-headers"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-requests')
source=("$_name-$pkgver.tar.gz::https://github.com/Ousret/kiss-headers/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('82ccdff68bc3ca3d3d33ffbebfc18d81946ae5ede4b35aaca74093b78bb18a4d')

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
