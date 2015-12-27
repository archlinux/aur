# Maintainer: surefire <surefire@cryptomile.net>

pkgname=linconnect-server-git
pkgver=2.20.r8.g4d746b2
pkgrel=1
pkgdesc="LinConnect is a project to mirror all Android notifications on a Linux desktop using LibNotify."
arch=('any')
url="https://github.com/hauckwill/linconnect-server"
license=('GPL3')
depends=('python2-cherrypy' 'python2-gobject' 'python2-pybonjour') 
optdepends=('notification-daemon: if your desktop does not have built-in support notification')
makedepends=('git')
provides=('linconnect-server')
conflicts=('linconnect-server')
source=("${pkgname}::git+https://github.com/hauckwill/linconnect-server.git"
		'linconnect-server.desktop'
		'linconnect-server')
md5sums=('SKIP'
		'8c8a3ad7b1f14274e1a4620b60689f40'
		'0293e5243078515a4dead7269af9db8d')
install=linconnect-server.install

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	libdir="${pkgdir}/usr/lib/linconnect"
	
	install -dm0755 "${libdir}"
	install -dm0755 "${pkgdir}/etc/xdg/autostart/" 
	install -dm0755 "${pkgdir}/usr/share/applications/"
	install -dm0755 "${pkgdir}/usr/bin/"
	
	install -m0644  "${pkgname}/LinConnectServer/main/"{index.html,linconnect_server.py} "${libdir}"

	install -m0644  linconnect-server.desktop "${pkgdir}/etc/xdg/autostart"
	#install -m0644  linconnect-server.desktop "${pkgdir}/usr/share/applications"
	
	install -m0755  linconnect-server "${pkgdir}/usr/bin"
}
