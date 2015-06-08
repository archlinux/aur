# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=b43-firmware
_classic_=${pkgname}-classic
pkgver=6.30.163.46
pkgrel=1
pkgdesc="Firmware for Broadcom B43 wireless networking chips - latest release"
conflicts=${_classic_}
arch=("any")
url="https://wireless.wiki.kernel.org/en/users/Drivers/b43"
license=("GPL")
depends=("linux>=3.2")
makedepends=("b43-fwcutter>=018")
options=(!emptydirs)
source=(http://www.lwfinger.com/${pkgname}/broadcom-wl-${pkgver}.tar.bz2)

build() {
	# Messages
	warning "If you encounter problems with v6.30, try the '${_classic_}' package (v5.100) instead."
	read -p "==> PROMPT: Press any key to continue building this package ... " -n 1
}

package() {
	cd "${srcdir}"

	# Directories
	install -d "${pkgdir}"/usr/lib/firmware/

	# Application
	b43-fwcutter -w "${pkgdir}"/usr/lib/firmware/ broadcom-wl-${pkgver}.wl_apsta.o

	# Messages
	#msg "You should add 'b43' to the 'MODULES' array of your '/etc/rc.conf' file."
}

sha1sums=('237d29a7701429054f5c82c000ef2d9aa6f2c3db')
