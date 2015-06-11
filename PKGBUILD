## Maintainer: N. Izumi aka izmntuk
pkgname=fbterm-git
pkgver=20150509
pkgrel=1
pkgdesc='A fast framebuffer-based terminal emulator for Linux'
arch=(x86_64 i686)
url='https://github.com/izmntuk/fbterm'
license=('GPL2')
depends=('fontconfig')
makedepends=('gpm' 'libx86')
conflicts=('fbterm')
provides=('fbterm')
optdepends=('libx86: accelerator with VESA compatible video card' 'gpm: mouse selection support')
install=INSTALL
source=('git+https://github.com/izmntuk/fbterm' 'INSTALL')
sha1sums=(SKIP SKIP)

pkgver() {
	cd "${srcdir}/fbterm"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
	cd "${srcdir}/fbterm"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/fbterm"
	install -Dm644 terminfo/fbterm "${pkgdir}/usr/share/terminfo/f/fbterm"
	make DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
}
