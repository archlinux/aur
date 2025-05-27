# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ibc
pkgver=3.22.0
pkgrel=1
pkgdesc='Manages headless Interactive Brokers IB Gateway instances (formerly known as IB Controller)'
replaces=('ib-controller')
arch=('any')
url="https://github.com/IbcAlpha/IBC"
license=('GPL3')
depends=(ib-tws xorg-server-xvfb xorg-server gtk2 libxrender libxtst gsettings-desktop-schemas ttf-dejavu)
makedepends=(unzip)

backup=('etc/ibc/fdemo.ini'
        'etc/ibc/edemo.ini')
source=("https://github.com/IbcAlpha/IBC/releases/download/${pkgver}/IBCLinux-${pkgver}.zip"
        'edemo.ini'
        'fdemo.ini'
        'ibc@.service')
md5sums=('f3b6cf23d3b0b24715c15fd7614a6890'
         'bb71f8d19adb46d70f231e0a9450ea72'
         'cc3125dc6f5de0a12b6714a59b769e12'
         '8241856ca372103d91a1a4aeade2d7cb')

build() {
	cd ${srcdir}
	unzip -o IBCLinux-${pkgver}.zip IBC.jar
}

package() {
	install -Dm644 ${srcdir}/IBC.jar ${pkgdir}/usr/share/java/ibc/IBC.jar
	install -Dm600 ${srcdir}/fdemo.ini ${pkgdir}/etc/ibc/fdemo.ini
	install -Dm600 ${srcdir}/edemo.ini ${pkgdir}/etc/ibc/edemo.ini
	install -Dm644 ${srcdir}/ibc@.service ${pkgdir}/usr/lib/systemd/system/ibc@.service
}
