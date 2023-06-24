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
	install -dm755 ${pkgdir}/usr/bin
	install -dm755 ${pkgdir}/usr/lib/systemd/system
	install -dm755 ${pkgdir}/etc/awol
	install -Dm644 awold.service ${pkgdir}/usr/lib/systemd/system/
	install -Dm644 awold.conf "$pkgdir"/etc/awol/
	install -Dm755 awold "$pkgdir"/usr/bin/
}
