# Maintainer: Ben Alex <ben.alex@acegi.com.au>

# See https://github.com/benalexau/libnx-aur for AUR PKGBUILD history

pkgname=libnx
pkgver=2.9.477
pkgrel=1
pkgdesc='Nanex NxCore tape processing library'
arch=('x86_64')
url="http://nanex.net"
license=('custom')
depends=('gcc-libs')
makedepends=('sed')

source=('LICENSE'
	'libnx.pc'
	'http://www.nanex.net/downloads/Linux/BETA/20141216.NxCoreAPIDU.tgz')
md5sums=('a6363119bc093d441db85bdf38c7b58e'
         '98834a18dc623ec64cf3b965fa8ec6bd'
         '3bd43ad96641781079ad80e50197d876')

package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm644 libnx.pc ${pkgdir}/usr/lib/pkgconfig/libnx.pc
	cd ${srcdir}/20141216.NxCoreAPIDU/NxCoreDU
	sed -i 's/nxcore\/NxCoreAPIDU.h/NxCoreAPIDU.h/' NxCoreC.h
	install -Dm644 NxCoreAPIDU.h ${pkgdir}/usr/include/NxCoreAPIDU.h
	install -Dm644 NxCoreLoadLib.h ${pkgdir}/usr/include/NxCoreLoadLib.h
	install -Dm644 NxCoreC.h ${pkgdir}/usr/include/NxCoreC.h
	install -Dm644 NxCoreTableHelper.h ${pkgdir}/usr/include/NxCoreTableHelper.h
	install -Dm644 libnx.so ${pkgdir}/usr/lib/libnx.so
}
