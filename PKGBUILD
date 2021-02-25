# Maintainer: Winux winuxlinux11@gmail.com

pkgname=btusb-qca-0x3004-dkms
url=https://aur.archlinux.org/packages/btusb-qca-0x3004-dkms
pkgver=0.8
pkgrel=1
pkgdesc="patch btusb so it works on QCA devices with id 0x3004 (DKMS version)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms')
makedepends=('linux-headers')
conflicts=('btusb-qca-0x3004')
source=("Makefile"
	"dkms.conf"
	"btusb.patch"
	"btusb.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btusb.c?id=refs/tags/v5.10.6"
	"btintel.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btintel.h?id=refs/tags/v5.10.6"
	"btbcm.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btbcm.h?id=refs/tags/v5.10.6"
	"btrtl.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btrtl.h?id=refs/tags/v5.10.6")
md5sums=('7ee26200839cf70c1dcdc8bebc743e9b'
         '09d09936925500ca8c356a4c1c4b0d3a'
         '01c0bbce4dbc96d3773783b3fa2969a2'
         '4e30ace94e0c3842da7d16c1d8dfded1'
         '764863abf53cb70bc04a3af1c24d226e'
         '4c5d3ed81979cc6af062b381731d25e3'
         'ed7b0912a2e3507068c0d173ed9338fa')

package() {
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

	# Set name and version
	sed -e "s/@PKGNAME@/${pkgname}/" \
		-e "s/@PKGVER@/${pkgver}.1/" \
		-i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

	install -Dm644 btusb.c "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btusb.c

	sed -e "s/define VERSION \"${pkgver}\"/define VERSION \"${pkgver}.1\"/" \
		-i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btusb.c

	install -Dm644 btintel.h "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btintel.h
	install -Dm644 btbcm.h "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btbcm.h
	install -Dm644 btrtl.h "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btrtl.h
	install -Dm644 Makefile "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
}
