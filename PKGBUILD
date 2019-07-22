# Maintainer: William Termini <aur@termini.me>
pkgname=basiliskii-git
pkgver=r2403.b58a926
pkgrel=1
pkgdesc="An Open Source 68k Macintosh Emulator"
arch=('x86_64')
url="http://basilisk.cebix.net"
license=('GPL')
depends=('gtk2' 'sdl' 'vde2')
provides=("basiliskii=$pkgver")
conflicts=("basiliskii")
source=(git+https://github.com/cebix/macemu)
makedepends=('git' 'make' 'autoconf')
sha1sums=('SKIP')

pkgver() {
	cd macemu
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd macemu/BasiliskII/src/Unix
	./autogen.sh \
		--prefix=/usr \
		--enable-sdl-video \
		--enable-sdl-audio \
		--enable-jit-compiler \
		--with-bincue \
		--with-vdeplug \
		;
	make -j1
}

package() {
	cd macemu/BasiliskII/src/Unix
	make DESTDIR="$pkgdir/" install
}
