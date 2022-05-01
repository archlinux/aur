# Maintainer: Sematre <sematre at gmx dot de>
pkgname=discimagecreator
pkgver=20220501
pkgrel=1

pkgdesc="This is the disc (CD, GD, DVD, HD-DVD, BD, GC/Wii, XBOX, XBOX 360) and disk (Floppy, MO, USB etc) image creation tool."
arch=('any')
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5a01f8146da84560a8f88ec5d26bf8edd201c5e27d350e30f9926a0f4ce72b01')

build() {
	cd "DiscImageCreator-${pkgver}"
	make -C DiscImageCreator/
}

package() {
	cd "DiscImageCreator-${pkgver}"

	make -C DiscImageCreator/ DESTDIR="${pkgdir}" PREFIX="/usr" install
	ln -s "DiscImageCreator" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
