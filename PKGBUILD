# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='irssi-xmpp-git'
pkgdesc='irssi plugin to connect to the Jabber network (cdidier version)'
pkgver=v0.53.1.gb12ca69
pkgrel=1
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('GPL2')
url="https://github.com/cdidier/irssi-xmpp"
depends=('loudmouth' 'irssi')
makepdends=('pkg-config')
conflicts=('irssi-xmpp-cvs' 'irssi-xmpp')
provides=('irssi-xmpp')
source=("${pkgname}::git+${url}" use_tls.patch)
sha512sums=('SKIP'
            '87fa715cdc438f2f5a7c1cbe64e168b624547b5ac4f5114687737cb65bc5f9c1016634dee05a7a0e2c831b18e5a415eea5c8f87caa50591e3977d873f76601d6')

pkgver () {
	cd "${pkgname}"
	git describe --long --tags | sed -r 's/^REL0(.*)$/r0.\1/;y/-/./'
}

prepare () {
	cd "${pkgname}"
	patch -p0 < "${srcdir}/use_tls.patch"
}

build () {
	cd "${pkgname}"
	make PREFIX=/usr IRSSI_INCLUDE=/usr/include/irssi
}

package () {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
