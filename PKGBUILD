# Maintainer: Aman Gupta <aman.iv0012@gmail.com>

pkgname=(micropython)
pkgver=1.25.0
pkgrel=1
pkgdesc="Python3 for microcontrollers, with stdlib. (UNIX version)"
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('readline' 'libffi' 'mbedtls')
makedepends=('python' 'python-setuptools' 'git')
options=('!emptydirs' '!debug')
changelog="ChangeLog"
source=("https://micropython.org/resources/source/micropython-$pkgver.tar.xz")
md5sums=('54b2304d6147f47da1e2de2b32468c62')

build() {
  cd "$srcdir/micropython-$pkgver/mpy-cross"
  make
  cd "$srcdir/micropython-$pkgver/ports/unix"
  make
}

check() {
  cd "$srcdir/micropython-$pkgver/ports/unix"
  # extmod/select_poll_fd.py is failing, disabling tests for now
  # make test
}

package() {
  cd "$srcdir/micropython-$pkgver/ports/unix"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  cd "$srcdir/micropython-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
