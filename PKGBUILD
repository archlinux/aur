# Maintainer: Katy Moe katy@katy.moe

_kernver="$(uname -r)"
_kernver_base="$(echo $_kernver | cut -d- -f1)"
pkgname=btusb-qca-0x3004
_pkgname=btusb
url=https://github.com/kmoe/btusb-qca-0x3004
pkgver=0.9.5.10.6
pkgrel=1
pkgdesc="patch btusb so it works on QCA devices with id 0x3004"
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux-headers')
source=("Makefile"
	"btusb.patch"
	"btusb-qca-0x3004.install"
	"btusb.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btusb.c?id=refs/tags/v5.10.6"
	"btintel.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btintel.h?id=refs/tags/v5.10.6"
	"btbcm.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btbcm.h?id=refs/tags/v5.10.6"
	"btrtl.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/drivers/bluetooth/btrtl.h?id=refs/tags/v5.10.6")
install=btusb-qca-0x3004.install
	
pkgver() {
 printf "0.9.%s" "$(uname -r | cut -d- -f1)"
}

prepare() {
	echo $_kernver_base
	\cp --remove-destination $(readlink btusb.c) btusb.c
	patch -p1 < btusb.patch
}

build() {
	make
}

package() {
	install -Dm644 btusb.ko "$pkgdir/usr/lib/modules/$_kernver/updates/btusb.ko"
}

md5sums=('369ff1a06ddfa06bc68bd776d3fbc97e'
         'bf67cf7e920e90f399fafadc2d26f9d7'
         '3b63db7fbf7aab07322b0a1f71a7ffdb'
         '4e30ace94e0c3842da7d16c1d8dfded1'
         '764863abf53cb70bc04a3af1c24d226e'
         '4c5d3ed81979cc6af062b381731d25e3'
         'ed7b0912a2e3507068c0d173ed9338fa')
