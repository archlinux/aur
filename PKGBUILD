# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>
pkgname=r8723bs-git
_pkgname=r8723bs
pkgver=6b0aec21412f2b1616574ddd62d6287648c097c7
pkgrel=3
url="http://www.realtek.com.tw/"
provides=('r8723bs')
arch=('any')
license=('GPL')
install=r8723bs-git.install
builddepends=('linux-headers')
source=("${_pkgname}::git+https://github.com/hadess/rtl8723bs"
	'blacklist-8723bs.conf')
sha256sums=('SKIP'
            '52582494094670fd8c2aed16f4c8e2589889054810a0c5cf67bf2abe6473f7ea')

build() {
	
	cd "${srcdir}/${_pkgname}/"
	make all $MAKEFLAGS
	make strip
}

package() {
	cd "${srcdir}/${_pkgname}/"
	_kver=$(uname -r)
	mkdir -p "${pkgdir}/usr/lib/modules/${_kver}/kernel/drivers/net/wireless/r8723bs/"
	mkdir -p "${pkgdir}/usr/lib/firmware/rtlwifi/"
	install -p -m 644 r8723bs.ko "${pkgdir}/usr/lib/modules/${_kver}/kernel/drivers/net/wireless/r8723bs/"
	install -p -m 644 rtl8723bs_nic.bin "${pkgdir}/usr/lib/firmware/rtlwifi/"
        install -p -m 644 rtl8723bs_wowlan.bin "${pkgdir}/usr/lib/firmware/rtlwifi/"
	install -p -m 644 rtl8723bs_ap_wowlan.bin "${pkgdir}/usr/lib/firmware/rtlwifi/"
	install -p -m 644 rtl8723bs_bt.bin "${pkgdir}/usr/lib/firmware/rtlwifi/"
}

