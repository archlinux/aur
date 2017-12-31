# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Alexander Blinne <alexander[at]blinne[dot]net>
#
pkgname="fatresize"
pkgver="1.0.4"
pkgrel="2"
pkgdesc="A utility to resize FAT filesystems using libparted."
url="http://sourceforge.net/projects/fatresize/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('libparted' 'glibc')
makedepends=('docbook-to-man')
source=("https://codeload.github.com/ya-mouse/${pkgname}/tar.gz/v${pkgver}")
sha256sums=('7f3ab7a9ac92335f66d239419860f674359449d49cf67ba1af7a8b686303612b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	autoreconf -fisv
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
