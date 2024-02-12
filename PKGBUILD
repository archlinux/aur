# Maintainer: Nico Huber <nico.h@gmx.de>

pkgname="flashprog"
pkgdesc="Flashprog is a utility which can be used to detect, read, erase, or write BIOS chips (DIP, PLCC, SPI)."
pkgver=1.0.1
pkgrel=1
url="https://flashprog.org/"
license=('GPL')
source=(git+https://review.sourcearcade.org/flashprog.git?signed#tag=v${pkgver})
validpgpkeys=('2853079C9C66AB7E82C64966A5C163B7E557CAEB')
sha256sums=('SKIP')
depends=('pciutils' 'libusb' 'libftdi' 'libjaylink' 'libgpiod')
makedepends=('git' 'make')
optdepends=("dmidecode: for SMBIOS/DMI table decoder support")
arch=('riscv64' 'aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/man/man8"
	install -m 0755 flashprog "${pkgdir}/usr/bin/"
	install -m 0644 flashprog.8 "${pkgdir}/usr/man/man8/"
	install -m 0755 util/ich_descriptors_tool/ich_descriptors_tool "${pkgdir}/usr/bin/"
}
