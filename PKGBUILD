# Maintainer: Mjasnik

_pkgname=awol
pkgname=$_pkgname
pkgver=0.1
pkgrel=1
pkgdesc="Anti-WOL (sleep / shutdown / restart on WOL) daemon"
arch=('any')
url='https://gitlab.com/mjasnik/awol'
license=('GPL')
depends=('systemd')
makedepends=('git' 'asio')
provides=('awol')
conflicts=('awol-git')
source=("$_pkgname::git+https://gitlab.com/mjasnik/awol")
md5sums=('SKIP')

build() {
	cd "$_pkgname"
	g++ -s -o awold awol.cpp
}
package() {
	cd "$_pkgname"
	install -m755 -d ${pkgdir}/usr/bin
	install -m755 -d ${pkgdir}/lib/systemd/system
	install -m755 -d ${pkgdir}/etc/awol
	install -m644 awold.service ${pkgdir}/lib/systemd/system
	install -m755 awold.conf "$pkgdir"/etc/awol
	install -m755 awold "$pkgdir"/usr/bin
}
