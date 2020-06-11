
_pkgbase=hid-nintendo
pkgname=hid-nintendo-nso-dkms
pkgver=1.1
pkgrel=2
pkgdesc="HID driver for Nintendo Switch controllers patched with Switch Online NES and SNES controller support."
arch=('x86_64' 'aarch64')
url="https://github.com/nadiaholmquist/linux/tree/hid-nintendo"
license=("GPL2")
depends=('dkms')
source=('hid-nintendo.c' 'dkms.conf' 'hid-ids.h')
conflicts=(hid-nintendo-dkms)

md5sums=('dbc0bd6f144503547cb6e140c1ea2729'
         '6d97239c33773b3f2fc5d497e98a1017'
         '6d1c428af9d73b4fd493ee1d4465700b')

package() {
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	install -Dm644 hid-nintendo.c "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/hid-nintendo.c
	install -Dm644 hid-ids.h "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/hid-ids.h
	install -Dm644 Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile
}
