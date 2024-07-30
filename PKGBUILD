# Maintainer: 3mb3dw0rk5 <3mb3dw0rk5 at gmail dot com>

pkgname=hexcurse-git
pkgver=v1.60.0.r92.gefabe05
pkgrel=2
pkgdesc="Versatile ncurses-based hex editor."
arch=('x86_64')
url="https://github.com/prso/hexcurse"
license=('GPL')
makedepends=('git')
depends=('ncurses')
provides=('hexcurse')
conflicts=('hexcurse')
options=('!makeflags')
source=("git+https://github.com/prso/hexcurse")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"

  autoreconf -f -i
  ./configure \
	--prefix=/usr \
	--mandir=/usr/share/man

  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make DESTDIR="$pkgdir/" install
}
