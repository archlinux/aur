# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy
pkgname=python-$_pkgname
pkgver=0.42.0
pkgrel=1
pkgdesc='Library implementation of the Zigbee Home Automation standard'
url='https://github.com/zigpy/zigpy'
arch=('any')
license=('GPL3')
depends=('python' 'python-aiohttp' 'python-aiosqlite' 'python-crccheck'
         'python-pycryptodome' 'python-voluptuous')
makedepends=('git')
checkdepends=('python-pytest')
source=($pkgname::"git+https://github.com/zigpy/zigpy#tag=$pkgver")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  pytest
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" -O1 --skip-build
}
