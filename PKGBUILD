# Maintainer: Sematre <sematre at gmx dot de>
pkgname=discimagecreator
pkgver=20231201
pkgrel=1

pkgdesc="This is the disc (CD, GD, DVD, HD-DVD, BD, GC/Wii, XBOX, XBOX 360) and disk (Floppy, MO, USB etc) image creation tool."
arch=('x86_64')
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('72d2218949a52bddcf4d2b8119a25a4f0bc974fb96b9df8f25ac3a095fa7dc4b')

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
