# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
# Contributor: Marcin Kornat <rarvolt+aur@gmail.com>
# Contributor: MatejSpindler <spindler.matej@gmail.com>

pkgname=esptool-git
pkgver=3.0.r26.gdb4df64
pkgrel=1
pkgdesc="A cute Python utility to communicate with the ROM bootloader in Espressif ESP8266"
arch=('any')
url="https://github.com/espressif/esptool"
license=('GPL2')
makedepends=('git' 'python-setuptools' 'python-wheel')
depends=('python-pyserial' 'python-ecdsa' 'python-pyaes' 'python-cryptography' 'python-bitstring' 'python-reedsolo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/espressif/esptool")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python3 setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

