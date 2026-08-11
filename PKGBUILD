# Maintainer: gfrank227 [at] gmail [dot] com
pkgname=nordvpn-gui-bin
pkgver=5.3.0
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
sha256sums=('e2e3a15cd3ebd27cdc21570b66f3435a9ad16af45ef29af8c5c399a8df185133'
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
