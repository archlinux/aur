# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=tty-clock-git
_pkgname="tty-clock"
pkgver=181.9e00c32
pkgrel=1
pkgdesc="Analog clock in ncurses."
arch=('i686' 'x86_64' 'armv6h')
url="http://github.com/xorg62/tty-clock"
license=('BSD')
depends=('ncurses')
source=("git+https://git@github.com/xorg62/tty-clock.git")
md5sums=("SKIP")
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's/CFLAGS ?=/CFLAGS +=/' Makefile
  sed -i 's/LDFLAGS ?=/LDFLAGS +=/' Makefile
  sed -i 's/LDFLAGS ?=/LDFLAGS +=/' Makefile
  sed -i 's/${SRC} -o/${SRC} -lncurses -o/' Makefile
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
} 
