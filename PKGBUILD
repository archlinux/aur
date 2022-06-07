# Maintainer: Sematre <sematre at gmx dot de>
pkgname=discimagecreator
pkgver=20220606
pkgrel=1

pkgdesc="This is the disc (CD, GD, DVD, HD-DVD, BD, GC/Wii, XBOX, XBOX 360) and disk (Floppy, MO, USB etc) image creation tool."
arch=('any')
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7a4d49256db450f6bc3432b0fcfd4e0b5221d65993acf3db5411eb188fb0374b')

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
