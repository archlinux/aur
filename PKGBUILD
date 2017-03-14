# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>

pkgbase=simavr
pkgname=(simavr-asc simavr-asc-examples)
pkgver=1.5
pkgrel=1
pkgdesc='A lean, mean and hackable AVR simulator'
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/buserror/simavr"
license=('GPL3')
depends=('elfutils')
makedepends=('avr-libc' 'git' 'freeglut' 'glu')
source=("${pkgbase}::git+https://github.com/buserror/simavr.git#tag=v${pkgver}")
options=(!strip)
md5sums=('SKIP')
provides=(simavr)
conflicts=(simavr)
replaces=(simavr)

build() {
  cd "$srcdir/$pkgbase"

  make AVR_ROOT=/usr/avr RELEASE=1 \
      CFLAGS="-Wall -Wextra -fPIC -O2 -std=gnu99 -Wno-sign-compare -Wno-unused-parameter" \
      build-simavr build-examples
}

package_simavr-asc() {
  cd "$srcdir/$pkgbase"
  make PREFIX="/usr" DESTDIR="$pkgdir/usr" install
}

package_simavr-asc-examples() {
  depends=(simavr-asc=$pkgver freeglut glu)
  provides=(simavr-examples)
  conflicts=(simavr-examples)
  replaces=(simavr-examples)
  cd "$srcdir/$pkgbase"
  install -d $pkgdir/usr/share/doc
  cp -r examples $pkgdir/usr/share/doc/$pkgbase
}

