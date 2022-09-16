# Maintainer: Sematre <sematre at gmx dot de>
pkgname=discimagecreator
pkgver=20220909
pkgrel=1

pkgdesc="This is the disc (CD, GD, DVD, HD-DVD, BD, GC/Wii, XBOX, XBOX 360) and disk (Floppy, MO, USB etc) image creation tool."
arch=('any')
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1481c4c57941c93bde6aab4637442c796ee8b3518d1278fcd2c5fb7726eb7179')

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
