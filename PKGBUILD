# Maintainer: hashworks <mail@hashworks.net>

pkgname=prismatik-psieg
pkgver=5.11.2.27
pkgrel=1
pkgdesc="A controller for usb driven LED backlights (an unofficial fork)"
arch=('x86_64')
url="https://github.com/psieg/Lightpack"
license=('GPL3')
depends=('qt5-serialport' 'hicolor-icon-theme' 'libpulse' 'fftw')
makedepends=('qt5-tools')
provides=('lightpack' 'prismatik')
conflicts=('lightpack' 'prismatik')
install=prismatik.install
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9ec0535df8c54e4b70397643f7a2ebd3eb84e5d440e0f5eca0b527d58903462f')

build() {
	cd "Lightpack-${pkgver}/Software"
	qmake -r
	make
}

package() {
	cd "Lightpack-${pkgver}/Software"
	install -Dm755 bin/Prismatik "${pkgdir}/usr/bin/prismatik"
	install -Dm644 dist_linux/deb/etc/udev/rules.d/93-lightpack.rules "${pkgdir}/etc/udev/rules.d/93-lightpack.rules"
	install -Dm644 dist_linux/deb/usr/share/icons/hicolor/22x22/apps/prismatik-on.png "${pkgdir}/usr/share/icons/hicolor/22x22/apps/prismatik-on.png"
	install -Dm644 dist_linux/deb/usr/share/icons/Prismatik.png "${pkgdir}/usr/share/icons/Prismatik.png"
	install -Dm644 dist_linux/deb/usr/share/applications/prismatik.desktop "${pkgdir}/usr/share/applications/prismatik.desktop"
	install -Dm644 dist_linux/deb/usr/share/pixmaps/Prismatik.png "${pkgdir}/usr/share/pixmaps/Prismatik.png"
	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
