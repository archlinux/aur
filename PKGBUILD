# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-deconz
pkgname=python-$_pkgname
pkgver=0.14.0
pkgrel=1
pkgdesc='Zigpy support for deCONZ based Zigbee radio devices.'
url='https://github.com/zigpy/zigpy-deconz'
arch=('any')
license=('GPL3')
depends=('python' 'python-zigpy' 'python-pyserial-asyncio')
makedepends=('git')
checkdepends=('python-pytest-asyncio')
source=($pkgname::"git+https://github.com/zigpy/zigpy-deconz#tag=$pkgver")
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
