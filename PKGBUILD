# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-deconz
pkgname=python-$_pkgname
pkgver=0.14.0
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
sha512sums=('8552f3db53a47f280efcb6d297d432ddbfb30f4524fb46978ee20d1cb4612d69a3003ec96223c681c33253661c93de17595a3ac9f866a75b057c44b9fb524126')

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
