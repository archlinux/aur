# Maintainer: Eric Busch <me@etbus.ch>
_name=pypkjs
pkgname=pypkjs
pkgver=2.0.7
pkgrel=1
pkgdesc="PebbleKit JS phone-app simulator, used by pebble-tool's managed QEMU emulator for JS/sensor emulation"
arch=('any')
url="https://github.com/coredevices/pypkjs"
license=('MIT')
depends=('python' 'python-gevent' 'python-gevent-websocket' 'python-greenlet'
         'python-peewee' 'python-pygeoip' 'python-pypng' 'python-dateutil'
         'python-requests' 'python-sh' 'python-six' 'python-websocket-client'
         'python-libpebble2' 'python-netaddr' 'python-stpyv8')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/13/04/f557119b1f67ec85a73abec3448e1900271bdcd0cfa43039447eb3926c95/$_name-$pkgver.tar.gz")
sha256sums=('8b0a08ad4f49eae6698bf54a899fc1c88c12c98bc777e2d688b207c8985f05e0')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
