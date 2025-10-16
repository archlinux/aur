# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=rpi-keyboard-config
pkgname=$_pkgname-git
pkgver=20250915.r1.771a82d
pkgrel=1
pkgdesc='A Python library and command-line tool for configuring Raspberry Pi keyboards, including keymap customisation and RGB LED control'
url='https://github.com/raspberrypi/rpi-keyboard-config'
license=('BSD-3-Clause')
arch=('any')
depends=('python')
provides=("$_pkgname")
source=('git+https://github.com/raspberrypi/rpi-keyboard-config')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
