# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-deconz
pkgname=python-$_pkgname
pkgver=0.19.1
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
b2sums=('5a4eae587046d0bd3a0b2ca934113fefa74e6ad2cb1e0272616a427809382190bbd916970eb5acadcd91e48e6e72f489cac20d869bb3c3c074c3c269b734328f')

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
