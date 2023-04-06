
_pkgbase=hid-nintendo
pkgname=hid-nintendo-nso-dkms
pkgver=20230406
pkgrel=1
pkgdesc="HID driver for Nintendo Switch controllers patched with Switch Online NES, SNES and N64 controller support."
arch=('x86_64' 'aarch64')
url="https://github.com/nadiaholmquist/linux/tree/hid-nintendo"
license=("GPL2")
depends=('dkms')
source=('hid-nintendo.c' 'dkms.conf' 'hid-ids.h' 'Makefile')
conflicts=(hid-nintendo-dkms)

md5sums=('95aaf1a8aeaee02a8e7ba2c23e74f020'
         '54ffcf23a7c3c8e002b58c580d920f87'
         '86ce3f841c60b66bf3e0278f8e93659c'
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
