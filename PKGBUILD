# Maintainer: Sematre <sematre at gmx dot de>
pkgname=discimagecreator
pkgver=20220707
pkgrel=2

pkgdesc="This is the disc (CD, GD, DVD, HD-DVD, BD, GC/Wii, XBOX, XBOX 360) and disk (Floppy, MO, USB etc) image creation tool."
arch=('any')
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dc37e287e95782cb4a35e9dd4a28b02e180105a7ca45a09e28cf713eb3e81555')

build() {
	cd "DiscImageCreator-${pkgver}"
	make -C DiscImageCreator/
}

package() {
	cd "DiscImageCreator-${pkgver}"

	make -C DiscImageCreator/ DESTDIR="${pkgdir}" PREFIX="/usr" install
	ln -s "DiscImageCreator" "${pkgdir}/usr/bin/${pkgname}"

	# Install missing offset file
	install -Dm 644 "Release_ANSI/driveOffset.txt" "${pkgdir}/usr/local/share/DiscImageCreator/driveOffset.txt"

	install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
