# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=firmware-manager
pkgver=0.1.1
pkgrel=2
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'gtk3' 'openssl' 'libgudev')
makedepends=('rust')
optdepends=('fwupd' 'system76-firmware-daemon')
install="${pkgname}.install"
source=("https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f62e31d56a5b36beb7d4867bfa9831147f5f82cd48d34516171c266fa81a1a9b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make prefix=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install prefix=/usr

  ln -s /usr/bin/com.system76.FirmwareManager "${pkgdir}/usr/bin/${pkgname}"
}
