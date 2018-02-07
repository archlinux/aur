# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de> aka DL1CAF

pkgname=gpredict
pkgver=2.2.1
pkgrel=1
pkgdesc="Real-time satellite tracking and orbit prediction application"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://gpredict.oz9aec.net/"
license=('GPL')
depends=('curl' 'grig' 'gtk2' 'goocanvas')
makedepends=('intltool')
options=('!emptydirs')
source=("https://github.com/csete/gpredict/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
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

sha256sums=('e759c4bae0b17b202a7c0f8281ff016f819b502780d3e77b46fe8767e7498e43'
            'f42d3a4d4c7db251b86d36ae2c689dbcc14adb6444a1f14f8d329afba21616c3')
