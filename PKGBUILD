# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-gevent-eventemitter
_name=${pkgname#python-}
pkgver=2.1
pkgrel=3
pkgdesc="EventEmitter using gevent"
arch=('any')
url="https://github.com/rossengeorgiev/gevent-eventemitter"
license=('MIT')
depends=('python' 'python-gevent')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-cov')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec44e3a69c3eab31462babc089d6d650be49e5186258f6284e43b9c7398926b1')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  make test
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
