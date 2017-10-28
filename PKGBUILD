# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Alexander Blinne <alexander[at]blinne[dot]net>

pkgname="fatresize"
pkgver="1.0.3"
pkgrel="1"
pkgdesc="A utility to resize FAT filesystems using libparted."
url="http://sourceforge.net/projects/fatresize/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('parted' 'glibc')
makedepends=('docbook-utils')
source=("https://codeload.github.com/ya-mouse/${pkgname}/tar.gz/v${pkgver}")
sha256sums=('fb28b5fa304d314fcd05ddfc59a9deca69fb63a6bbe6dc89fb2a6b12e317f629')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	autoreconf -fiv
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=4 sw=2 ft=sh et:
