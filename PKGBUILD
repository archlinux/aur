# Maintainer: Marcos Gutiérrez <margual56@gmail.com>
# Maintainer: Slimbook <dev@slimbook.es>

_pkgname=slimbookservice
pkgname=$_pkgname-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Service to get desktop notifications from your device'
url='https://github.com/Slimbook-Team/slimbook_service'
license=('GPL3')
arch=('x86_64')
depends=('python>=3')
makedepends=('python-pip')
provides=($_pkgname)
conflicts=($_pkgname)

source=("https://github.com/Slimbook-Team/slimbook_service/releases/download/$pkgver/slimbook_$pkgver.tar.xz")

md5sums=('SKIP')

prepare() {
	tar -xf slimbook_$pkgver.tar.xz
}

build() {
	pip install zmq evdev
}

package() {
	install -Dm755 "${srcdir}/slimbook-${pkgver}/bin/slimbookindicator" "${pkgdir}/usr/bin/slimbookindicator"
	cp -r "${srcdir}/slimbook-${pkgver}/etc/" "${pkgdir}/"
	cp -r "${srcdir}/slimbook-${pkgver}/usr/" "${pkgdir}/"
	install -Dm644 "${srcdir}/slimbook-${pkgver}/usr/share/slimbook/icons/slimbook_be1ofus_dark.svg" "${pkgdir}/usr/share/pixmaps/slimbook_be1ofus_dark.svg"
	install -Dm644 "${srcdir}/slimbook-${pkgver}/usr/share/slimbook/icons/slimbook_be1ofus_light.svg" "${pkgdir}/usr/share/pixmaps/slimbook_be1ofus_light.svg"
	mkdir -p "${pkgdir}/usr/share/applications/"
	install -Dm644 "${srcdir}/slimbook-${pkgver}/usr/share/slimbook/slimbook-client-autostart.desktop" "${pkgdir}/usr/share/applications/slimbook-client-autostart.desktop"
	install -Dm644 "${srcdir}/slimbook-${pkgver}/usr/share/slimbook/slimbook-indicator.desktop" "${pkgdir}/usr/share/applications/slimbook-indicator.desktop"
}

