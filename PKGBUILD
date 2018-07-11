# Maintainer: Jaroslav Supolik <jarda@supolik.cz>
pkgname=fbzx-git
pkgver=3.9.1.r2.52b99b0
pkgrel=2
pkgdesc="Sinclair Spectrum emulator, designed to work at full screen using the FrameBuffer or under X-Windows."
arch=(x86_64)
url="http://www.rastersoft.com/programas/fbzx.html"
license=('GPL3')
depends=('sdl' 'alsa-lib' 'libpulse')
makedepends=('git' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/rastersoft/fbzx')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	#make clean
	if [ ! -e README ]; then
	   ln -s README.md  README
	fi
	if [ ! -e VERSIONS.md ]; then
	  ln -s HISTORY.md VERSIONS.md
       fi
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
#	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
