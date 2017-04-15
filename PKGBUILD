# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=libmpsse-python3-git
pkgver=20170415.63656d4
pkgrel=1
pkgdesc="Open source library for SPI/I2C control via FTDI chips - Fixed for Python 3"
arch=('x86_64')
url="https://github.com/Streetwalrus/libmpsse"
license=('BSD')
depends=('libftdi')
optdepends=('python: Python support')
makedepends=('python' 'swig')
source=("git+https://github.com/Streetwalrus/libmpsse.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/libmpsse"
  git log -1 --format='%cd.%h' --date=short | tr -d -
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
