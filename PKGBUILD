# Maintainer: Eric Busch <me@etbus.ch>
_name=pebble_tool
pkgname=pebble-tool
pkgver=5.0.40
pkgrel=1
pkgdesc="Command-line tool for the Pebble SDK: build, install and debug apps for Pebble smartwatches"
arch=('any')
url="https://github.com/coredevices/pebble-tool"
license=('MIT')
depends=('python' 'python-cobs' 'python-colorama' 'python-freetype-py'
         'python-google-auth' 'python-google-auth-oauthlib' 'python-httplib2'
         'python-libpebble2' 'python-oauth2client' 'python-pillow'
         'python-packaging' 'python-progressbar' 'python-pyasn1'
         'python-pyasn1-modules' 'python-pyqrcode' 'python-pyserial'
         'python-pypng' 'python-requests' 'python-rsa' 'python-six'
         'python-sourcemap' 'python-websocket-client' 'websockify'
         'python-wheel' 'npm')
optdepends=('pypkjs: required by the default managed QEMU emulator (`pebble install --emulator <platform>`); not a hard depend because it pulls in python-stpyv8, which is x86_64-only')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/24/01/b0ca611473d17c23312441ef6d24a97299df5c697008b1703898c5ea6ab6/$_name-$pkgver.tar.gz")
sha256sums=('67ca56dd8ac4ed9e302c449c99ff17e0c7169c28ca5e252a12840680781e8e09')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
