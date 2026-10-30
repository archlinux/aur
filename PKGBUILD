# Maintainer: Eric Busch <me@etbus.ch>
_name=pypkjs
pkgname=pypkjs
pkgver=3.0.3
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
source=("https://files.pythonhosted.org/packages/09/3f/578ae59babf9ddbd8528bd440afbfa322ce1674aa0a6ff98759099642a61/$_name-$pkgver.tar.gz")
sha256sums=('655b5144a10ead744dd37628af043cae87ca54c95149dcc16407e0115584ca44')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
