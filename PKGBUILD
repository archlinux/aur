# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
# Contributor: Marcin Kornat <rarvolt+aur@gmail.com>
# Contributor: MatejSpindler <spindler.matej@gmail.com>

pkgname=esptool-git
pkgver=5.6.0.r1.gaf1ed102
pkgrel=1
pkgdesc="A cute Python utility to communicate with the ROM bootloader in Espressif ESP8266"
arch=('any')
url="https://github.com/espressif/esptool"
license=('GPL2')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
depends=(
    'python'
    'python-click'
    'python-cryptography'
    'python-esp-pylib'
    'python-intelhex'
    'python-pyserial'
    'python-reedsolo'
    'python-rich-click'
    'python-yaml'
)
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
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

