# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=kamailio
pkgver=5.1.3
pkgrel=1
pkgdesc="Rock solid SIP server"
url="http://www.kamailio.org/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=()
makedepends=('flex' 'bison' 'docbook2x' 'mariadb' 'postgresql' 'libxml2'
             'freeradius-client' 'lua51' 'mono' 'hiredis' 'libpurple' 'net-snmp'
	     'libunistring' 'python2')
optdepends=('mariadb: mysql support'
            'expat: xmpp/jabber support'
	    'libxml2: cpl and presence modules support'
	    'postgresql: postgresql backend')
arch=('x86_64' 'i686')
source=(http://www.kamailio.org/pub/kamailio/$pkgver/src/kamailio-${pkgver}_src.tar.gz)
sha256sums=('b2266e15ec8ffa62be66b44989155f26a31d137f06f81fb3841aad8315315a14')
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
