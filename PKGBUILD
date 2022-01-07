# Maintainer: endaaman <endaaman@frontier.hokudai.ac.jp>

_gitname=tym
pkgname=tym-git
pkgver=3.1.3.r4.g4adea4c
pkgrel=1
pkgdesc="Lua-configurable terminal emulator"
arch=('x86_64')
url="https://github.com/endaaman/tym"
license=('MIT')
depends=('vte3' 'lua')
source=('tym::git+https://github.com/endaaman/tym#branch=master')
md5sums=(SKIP)
makedepends=(git)
conflicts=('tym')
provides=('tym')
pkgver() {
	cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd "$srcdir/$_gitname"
	autoreconf -fi
	./configure --prefix=/usr
	make
}
package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}
