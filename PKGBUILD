# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netinstall
pkgver=6.47.7
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
sha256sums=('c27212f20520ccdae2eb8df78b3ebe146707c9c4464d3daacc23abad5f0e1699'
            '9e96737ac5ba6c83579c7f816ed72786ef0caa9db30c7b4626379048250f5187'
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
