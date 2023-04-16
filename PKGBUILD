# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-deconz
pkgname=python-$_pkgname
pkgver=0.20.0
pkgrel=1
pkgdesc='Zigpy support for deCONZ based Zigbee radio devices.'
url='https://github.com/zigpy/zigpy-deconz'
arch=('any')
license=('GPL3')
depends=(
  'python'
  'python-zigpy'
  'python-pyserial-asyncio'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
)
checkdepends=('python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy-deconz/archive/$pkgver.tar.gz")
b2sums=('d02878183e0d05ab85488e9e9cad7fb717a0d1a1bf4cc46c2ae1cdb1f702553388e62ef46f6730f9c1251dc7c25e61dc27250437abbe1986786aafda77cc0926')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
