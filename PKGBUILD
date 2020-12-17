# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=firmware-manager
pkgver=0.1.2
pkgrel=1
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'gtk3' 'openssl' 'libgudev')
makedepends=('rust')
optdepends=('fwupd' 'system76-firmware-daemon')
install="${pkgname}.install"
source=("https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5bde56704ef8542f84ab9a8d6739cbfbcfcaaa26e089421fe0a527c5c9013f8d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make prefix=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install prefix=/usr

  ln -s /usr/bin/com.system76.FirmwareManager "${pkgdir}/usr/bin/${pkgname}"
}
