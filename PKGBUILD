# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de> aka DL1CAF

pkgname=gpredict
pkgver=1.3
pkgrel=3
pkgdesc="Real-time satellite tracking and orbit prediction application"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://gpredict.oz9aec.net/"
license=('GPL')
depends=('curl' 'grig' 'gtk2' 'goocanvas1')
makedepends=('intltool')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	LIBS=-lm ./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install
	# see /usr/share/licenses/common/GPL/license.txt
	rm ${pkgdir}/usr/share/${pkgname}/COPYING
	install -D -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

sha256sums=('b0f6beed8da1b2c513ba1f22593195c6097fc7ccfc66cba4bdbc16277238d5a3'
            'f42d3a4d4c7db251b86d36ae2c689dbcc14adb6444a1f14f8d329afba21616c3')
