# Maintainer: Shizeeg Unadequatov <shizeeque@gmail.com>
pkgname=quadra-git 
pkgver=1.3.0.r7.d6c7226
pkgrel=1
pkgdesc='An addictive action puzzle game with single player and multiplayer capabilities (Internet or LAN)'
arch=('x86_64')
url='https://github.com/quadra-game/quadra'
license=('LGPL2.1')
depends=('boost' 'libpng' 'sdl2')
makedepends=('git')
provides=("quadra")
source=("$pkgname::git+https://github.com/quadra-game/quadra.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
