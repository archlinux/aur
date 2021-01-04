# Maintainer: Nadia Holmquist Pedersen <nadia@nhp.sh>

_pkgbase=hid-playstation
pkgname=${_pkgbase}-dkms
pkgver=20210102
pkgrel=1
pkgdesc="Sony's official HID driver for the PS5 DualSense controller."
arch=(any)
url="https://patchwork.kernel.org/project/linux-input/list/?series=404369"
license=("GPL2")
depends=('dkms')
source=('hid-playstation.c' 'dkms.conf' 'hid-ids.h' 'Makefile')

md5sums=('11ca4528b5be12abe371027ded0f7012'
         '6d97239c33773b3f2fc5d497e98a1017'
         'c9585c976df5c262127bfe8b595824b3'
         'b5424fcb24f12a53b4ff18f1b85bcb23')

package() {
	cd "${srcdir}"

	install -Dm644 dkms.conf -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	install -Dm644 hid-playstation.c hid-ids.h Makefile \
		-t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
