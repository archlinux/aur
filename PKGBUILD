# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>

pkgname=libmpsse-python3-git
pkgver=r22.e9ca7d8
pkgrel=1
pkgdesc="Open source library for SPI/I2C control via FTDI chips - Fixed for Python 3"
arch=('x86_64')
url="https://github.com/9ary/libmpsse"
license=('BSD')
depends=('libftdi')
optdepends=('python: Python support')
makedepends=('python' 'swig')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/libmpsse"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/libmpsse/src"

  autoconf
  ./configure --prefix="/usr"
  make -j1
}

package() {
  cd "$srcdir/libmpsse/src"

  make install DESTDIR="$pkgdir/"

  install -Dm 644 ../docs/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
