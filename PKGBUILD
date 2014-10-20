# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='irssi-xmpp-git'
pkgdesc='irssi plugin to connect to the Jabber network (cdidier version)'
pkgver=r0.52.26.g4df4194
pkgrel=2
arch=('arm' 'i686' 'x86_64')
license=('GPL2')
url="https://github.com/cdidier/irssi-xmpp"
depends=('loudmouth' 'irssi')
makepdends=('pkg-config')
conflicts=('irssi-xmpp-cvs' 'irssi-xmpp')
provides=('irssi-xmpp')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	git describe --long --tags | sed -r 's/^REL0(.*)$/r0.\1/;y/-/./'
}

build () {
	cd "${pkgname}"
	make PREFIX=/usr IRSSI_INCLUDE=/usr/include/irssi
}

package () {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
