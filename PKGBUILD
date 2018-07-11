## Maintainer: N. Izumi aka izmntuk
pkgname=fbterm-git
pkgver=20150509
pkgrel=4
pkgdesc='A fast framebuffer-based terminal emulator for Linux'
arch=(x86_64 i686)
url='https://github.com/izmntuk/fbterm'
license=('GPL2')
depends=('fontconfig')
makedepends=('gpm' 'libx86')
conflicts=('fbterm')
provides=('fbterm')
optdepends=('libx86: accelerator with VESA compatible video card' 'gpm: mouse selection support')
install="${pkgname}.install"
source=(
	'git+https://github.com/izmntuk/fbterm'
	'fbterm-insertmode.patch'
	'0001-Fix-build-with-gcc-6.patch'
)

pkgver() {
	cd "${srcdir}/fbterm"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
	cd "${srcdir}/fbterm"
	patch -Np1 -i "${srcdir}/fbterm-insertmode.patch"
	patch -Np1 -i "${srcdir}/0001-Fix-build-with-gcc-6.patch"
}

build() {
	cd "${srcdir}/fbterm"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/fbterm"
	make DESTDIR="${pkgdir}" install
}
sha1sums=('SKIP'
          '11b95e4a90519156bc02dc0fa3b086f37820431b'
          '28772b49dbf9bfbeb21606a9e204d5ffa7fee45d')
