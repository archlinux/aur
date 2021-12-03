# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-crc16
pkgver=0.1.1
pkgrel=7
arch=(x86_64)
pkgdesc='Python library for calculating CRC16'
url="https://pypi.org/project/crc16/"
depends=(python)
license=('LGPL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
sha512sums=('45d5e8e13b1ac5f885b40516872a9233514f09aa8990915904b214eec2ef6084016f8f0c15bb411aaa1ffc32e8207020916f723e48eee726a7e6989901c9e65d')

build() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py build
}

check() {
  cd "${pkgname#python-}-$pkgver"
  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.10"  python -m crc16.test
}

package() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
