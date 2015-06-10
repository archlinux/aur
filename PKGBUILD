# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=kamailio
pkgver=4.3.0
pkgrel=1
pkgdesc="Rock solid SIP server"
url="http://www.kamailio.org/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=()
makedepends=('flex' 'bison' 'docbook2x' 'mariadb' 'postgresql' 'libxml2'
             'radiusclient-ng' 'lua51' 'mono' 'hiredis' 'libpurple' 'net-snmp'
	     'libunistring' 'python2')
optdepends=('mariadb: mysql support'
            'expat: xmpp/jabber support'
	    'libxml2: cpl and presence modules support'
	    'postgresql: postgresql backend')
arch=('x86_64' 'i686')
source=(http://www.kamailio.org/pub/kamailio/$pkgver/src/kamailio-${pkgver}_src.tar.gz)
sha256sums=('e4bd1d166a58817237809f754b39f3039c60ac0ab60794bb0f7627b6890caec4')
provides=()
conflicts=()
replaces=()
backup=('etc/kamailio/kamctlrc' 'etc/kamailio/kamailio.cfg' 'etc/kamailio/kamailio-basic.cfg' 'etc/kamailio/kamailio-advanced.cfg')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make proper
	sed -i 's/bin_dir = sbin\//bin_dir = bin\//g' Makefile.defs
	make prefix=${pkgdir}/usr cfg_prefix=${pkgdir} LIBDIR=lib config
	make all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install
}
