# Maintainer: Sematre <sematre at gmx dot de>
pkgname=discimagecreator
pkgver=20240401
pkgrel=1

pkgdesc="This is the disc (CD, GD, DVD, HD-DVD, BD, GC/Wii, XBOX, XBOX 360) and disk (Floppy, MO, USB etc) image creation tool."
arch=('x86_64')
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b0c992d4f2e01c92ef9352baa56dcfd3c23e1a115f9841b46ecfe066759a205c')

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
