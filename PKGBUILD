# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ibc
pkgver=3.8.7
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
md5sums=('6fbc36069fa1d6e4ded43dd7f8c7e18c'
         '55001e560331a3ee0c4988961090eff9'
         'a1bed3fed40a1a5165fbd86fb8204eec'
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
