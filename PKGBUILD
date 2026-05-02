# Maintainer: Will Handley <wh260@cam.ac.uk>

pkgname=python-umodbus
_pkgname=uModbus
pkgver=1.0.4
pkgrel=1
pkgdesc='Implementation of the Modbus protocol in pure Python'
arch=('any')
url='https://github.com/AdvancedClimateSystems/umodbus'
license=('MPL-2.0')
depends=('python-pyserial')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
  "https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/AdvancedClimateSystems/umodbus/$pkgver/LICENSE"
)
sha256sums=(
  '26bbbeff02d6d8a3e29bb0f9d9044c672d55fc1687afe4297a2f7d68175103a7'
  'af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e'
)

build() {
  cd "$_pkgname-$pkgver"
  python -m build -nw
}

check() {
  cd "$_pkgname-$pkgver"
  PYTHONPATH=$PWD python -c 'import umodbus'
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
