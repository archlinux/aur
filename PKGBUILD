# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=libtsm-asciinema-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Terminal-emulator State Machine - Patched for asciinema"
url="https://github.com/asciinema/libtsm/blob/asciinema/README"
license=("MIT")
depends=("glibc")
provides=("libtsm" "libtsm-asciinema")
makedepends=("libxkbcommon")
conflicts=('libtsm' 'libtsm-asciinema')
options=(!libtool)
source=('git://github.com/asciinema/libtsm')
sha512sums=('SKIP')
arch=("i686" "x86_64")

build() {
	cd "${srcdir}/libtsm"
	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/libtsm"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	make DESTDIR="${pkgdir}" install
}
