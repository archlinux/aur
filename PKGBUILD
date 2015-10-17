# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=linux-think-firmware
pkgdesc="Extra firmwares for linux-think"
pkgver=0.1
pkgrel=1
arch=('i686','x86_64')
url="https://github.com/the-darkvoid/BrcmPatchRAM/"
license=('')
arch=('any')
makedepends=('make'
	     'git'
	     'zlib')
source=('BCM20702A1_001.002.014.1483.1669_v5765.zhx'
	'git://github.com/jessesung/hex2hcd.git#branch=master')
md5sums=('21bb923d4445d3ae395d3cc2f5d53190'
	 'SKIP')

prepare(){
	zlib-flate -uncompress < "${srcdir}/BCM20702A1_001.002.014.1483.1669_v5765.zhx" > "${srcdir}/BCM20702A1_001.002.014.1483.1669_v5765.hex"
	cd ${srcdir}/hex2hcd
	make
}

package(){
	cd ${srcdir}
	./hex2hcd/hex2hcd BCM20702A1_001.002.014.1483.1669_v5765.hex BCM20702A1-0a5c-21e6.hcd > build.log
	install -D -m644 "${srcdir}/BCM20702A1-0a5c-21e6.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0a5c-21e6.hcd"
}
