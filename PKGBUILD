# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>
pkgname=r8723bs-git
_pkgname=r8723bs
pkgver=b3def82d8cbd0e7011bfaa6b70cd74725863e833
pkgrel=1
pkgdesc="Realtek R8723BS WIFI driver for RTL8723BS working on baytrail tablets - alternate to 8723bs"
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
	mkdir -p "${pkgdir}/lib/modules/${_kver}/kernel/drivers/net/wireless/r8723bs/"
	mkdir -p "${pkgdir}/lib/firmware/rtlwifi/" 
	install -p -m 644 r8723bs.ko "${pkgdir}/lib/modules/${_kver}/kernel/drivers/net/wireless/r8723bs/"
	install -p -m 644 rtl8723bs_nic.bin "${pkgdir}/lib/firmware/rtlwifi/" 
        install -p -m 644 rtl8723bs_wowlan.bin "${pkgdir}/lib/firmware/rtlwifi/"
	install -p -m 644 rtl8723bs_ap_wowlan.bin "${pkgdir}/lib/firmware/rtlwifi/" 
	install -p -m 644 rtl8723bs_bt.bin "${pkgdir}/lib/firmware/rtlwifi/"

}

