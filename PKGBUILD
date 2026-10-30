# Maintainer: Eric Busch <me@etbus.ch>
_name=pebble_tool
pkgname=pebble-tool
pkgver=5.1.1
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
source=("https://files.pythonhosted.org/packages/89/46/a5f424d32f92968c448df7e3ff4e1eaa3f8ef6f9403679a37fb21dd8f1b0/$_name-$pkgver.tar.gz")
sha256sums=('b79d5e43c4ce593eadab95dfb109ec7b652eb9e6ef1fdfea1e25681fa4c4d84f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
