# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cc65-git
pkgver=2.18.r6.93b6efcb2
pkgrel=1
pkgdesc='C compiler for 6502 family microprocessors'
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('cc65')
provides=('cc65')
license=('BSD')
url='https://cc65.github.io/cc65/'
source=(git+https://github.com/cc65/cc65)
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname/-git//}"

  printf "%s" "$(git describe --tags --long --first-parent \
                 | sed 's/^V//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${pkgname/-git//}"

  make PREFIX=/usr
}

package() {
  cd "${pkgname/-git//}"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}
