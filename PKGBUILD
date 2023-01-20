# Maintainer: Nico Huber <nico.h@gmx.de>

pkgname="flashrom-stable"
pkgdesc="Flashrom is a utility which can be used to detect, read, erase, or write BIOS chips (DIP, PLCC, SPI)."
pkgver=v1.0
pkgrel=1
url="https://review.coreboot.org/plugins/gitiles/flashrom-stable"
license=('GPL')
source=(git+https://review.coreboot.org/flashrom-stable.git?signed#tag=v1.0)
validpgpkeys=('2853079C9C66AB7E82C64966A5C163B7E557CAEB')
sha256sums=('SKIP')
depends=('pciutils' 'libusb' 'libftdi' 'libjaylink')
makedepends=('git' 'make')
optdepends=("dmidecode: for SMBIOS/DMI table decoder support")
conflicts=("flashrom")
arch=('riscv64' 'aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}"
	make CONFIG_JLINK_SPI=yes
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/man/man8"
	install -m 0755 flashrom "${pkgdir}/usr/bin/"
	install -m 0644 flashrom.8 "${pkgdir}/usr/man/man8/"
	install -m 0755 util/ich_descriptors_tool/ich_descriptors_tool "${pkgdir}/usr/bin/"
}
