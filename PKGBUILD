# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
pkgname=pebble-tool-git
pkgver=v4.6.rc1
pkgrel=1
pkgdesc="The pebble tool that goes with libpebble2"
arch=('any')
url="https://github.com/pebble-dev/pebble-tool"
license=('MIT')
depends=('python2'
         'python2-libpebble2-git'
         'python2-enum34'
         'python2-httplib2'
         'python2-oauth2client'
         'python2-progressbar2-old'
         'python2-pyasn1'
         'python2-pyasn1-modules'
         'python2-pypng'
         'python2-pyqrcode'
         'python2-requests'
         'python2-rsa'
         'python2-pyserial'
         'python2-six'
         'python2-sourcemap-git'
         'python2-websocket-client'
         'python2-wheel'
         'python2-colorama'
         'python2-packaging')
optdepends=('python2-virtualenv: Required for installing SDK'
            'arm-none-eabi-gcc: Required for installing SDK'
            'arm-none-eabi-newlib: Required for installing SDK'
            'qemu: Emulation support')
makedepends=('python2-setuptools')
conflicts=('pebble-sdk')
source=("git+https://github.com/pebble-dev/pebble-tool.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pebble-tool"
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd "$srcdir/pebble-tool"
  sed -i 's/==.*$//' requirements.txt
  sed -i 's/==.*'\'',$/'\'',/' setup.py
  sed -i 's/==.*'\'')$/'\'')/' setup.py
}

build() {
  cd "$srcdir/pebble-tool"
  python setup.py build
}

package() {
  cd "$srcdir/pebble-tool"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
