# Maintainer: Eric Busch <me@etbus.ch>
_name=pebble_tool
pkgname=pebble-tool
pkgver=5.0.39
pkgrel=4
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
source=("https://files.pythonhosted.org/packages/c5/6e/444de81db97ea030e219e82fdcfcc6fd5ff3d591d4003e1f4685186232b0/$_name-$pkgver.tar.gz")
sha256sums=('c2ec1eef7fd0ff73f4b0773492da7ed4b36bacb504e6813c41a560a9e7bf3564')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
