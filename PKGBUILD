# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netinstall
pkgver=6.48.4
pkgrel=1
pkgdesc='Mikrotik Netinstall for RouterOS'
arch=('i686' 'x86_64')
url='https://www.mikrotik.com/'
license=('custom')
depends=('wine' 'libcap')
makedepends=('icoutils')
install=netinstall.install
source=("https://download.mikrotik.com/routeros/${pkgver}/netinstall-${pkgver}.zip"
	'netinstall.c'
	'netinstall.desktop')
sha256sums=('8c0fa6f9377c01181270b694fbf2208f1f146a8468ade093027e69f894a5505f'
            'ab9a26feafb4822266634db5e654529baab431e4b6bf8c2798ecd195d441f235'
            '742b8ebf2b66697f24a27b5e6920dd4a4b92dec0fea928e8f58e499246284623')

build() {
	wrestool -x -t 14 netinstall.exe > netinstall.ico
	gcc ${CFLAGS} ${LDFLAGS} -o netinstall netinstall.c -lcap
}

package() {
	install -D -m0755 netinstall.exe ${pkgdir}/usr/share/netinstall/netinstall.exe
	install -D -m0755 netinstall ${pkgdir}/usr/bin/netinstall
	install -D -m0644 netinstall.desktop ${pkgdir}/usr/share/applications/netinstall.desktop
	install -D -m0644 netinstall.ico ${pkgdir}/usr/share/pixmaps/netinstall.ico
	install -D -m0644 LICENSE.txt ${pkgdir}/usr/share/licenses/netinstall/LICENSE.txt
}
