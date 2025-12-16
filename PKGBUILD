# Maintainer: gfrank227 [at] gmail [dot] com
pkgname=nordvpn-gui-bin
pkgver=4.3.0
pkgrel=1
arch=('x86_64')
pkgdesc='GUI for NordVPN'
url='https://nordvpn.com'
license=('Proprietary')
depends=('nordvpn' 'gtk3' 'hicolor-icon-theme')
options=('!debug')
install=daemon_restart.install
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn-gui/nordvpn-gui_${pkgver}_amd64.deb"
		"daemon_restart.install")
sha256sums=('e00de7d200d4b2c1b3647d22fe1db1d3daabd696dbf64de9545f554a3a62f9bd'
            'b3bc3b4519769cc9c78258b16eb44765ddd8168951997d8bafdc7b8fcb73d868')
conflicts=(nordvpn-gui)
prepare() {
	ar xv nordvpn-gui_${pkgver}_amd64.deb
	tar -xvzf data.tar.gz
}
package() {
	cp -rf $srcdir/opt $pkgdir/opt
	cp -rf $srcdir/usr $pkgdir/usr
	install -dm755 $pkgdir/usr/bin
	ln -s /opt/nordvpn-gui/nordvpn-gui $pkgdir/usr/bin/nordvpn-gui 
}
