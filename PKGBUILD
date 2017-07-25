# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>
pkgname=8723bs-git
_pkgname=8723bs
pkgver=16b2121fe13eca88653cd23a61640b043d0c5887
pkgrel=1
pkgdesc="RTL8723BS WIFI driver working on baytrail tablets. This driver uses an older codebase. kernel 4.12+ will include a newer version"
url="http://www.realtek.com.tw/"
provides=('8723bs')
arch=('any')
license=('GPL')
install=8723bs-git.install
builddepends=('linux-headers')
source=("${_pkgname}::git+https://github.com/muhviehstah/rtl8723bs"
	'blacklist-r8723bs.conf')
sha256sums=('SKIP'
            '7b269bda4c697037ff71647ada8591c887184d51c247f7a5d00cfacf787319d6')

build() {
	
	cd "${srcdir}/${_pkgname}/"
	make all $MAKEFLAGS
}

package() {
	cd "${srcdir}/${_pkgname}/"
	_kver=$(uname -r)
	mkdir -p "${pkgdir}/usr/lib/modules/${_kver}/kernel/drivers/net/wireless/rtl8723bs/"
	install -p -m 644 8723bs.ko "${pkgdir}/usr/lib/modules/${_kver}/kernel/drivers/net/wireless/rtl8723bs/"
}

