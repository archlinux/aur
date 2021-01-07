
_pkgbase=hid-nintendo
pkgname=hid-nintendo-nso-dkms
pkgver=1.2
pkgrel=1
pkgdesc="HID driver for Nintendo Switch controllers patched with Switch Online NES and SNES controller support."
arch=('x86_64' 'aarch64')
url="https://github.com/nadiaholmquist/linux/tree/hid-nintendo"
license=("GPL2")
depends=('dkms')
source=('hid-nintendo.c' 'dkms.conf' 'hid-ids.h' 'Makefile')
conflicts=(hid-nintendo-dkms)

md5sums=('f6592f96d94c215e3de807bd8a80c612'
         '6d97239c33773b3f2fc5d497e98a1017'
         '6d1c428af9d73b4fd493ee1d4465700b'
         '3a628988ca479023b45d2bd6b9b1cfb8')

package() {
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	install -Dm644 hid-nintendo.c "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/hid-nintendo.c
	install -Dm644 hid-ids.h "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/hid-ids.h
	install -Dm644 Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile
}
