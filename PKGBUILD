# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ibc
pkgver=3.18.0
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
md5sums=('e75689f0a0ccd32104be43cbea483af1'
         'bb71f8d19adb46d70f231e0a9450ea72'
         'cc3125dc6f5de0a12b6714a59b769e12'
         'e4cc6b5177719502cbcd9ea3a0152eab')

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
