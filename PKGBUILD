#Maintainer: ovi chis <sonekken@gmail.com>
pkgname=corosync
pkgver=2.3.5
pkgrel=1
pkgdesc="Cluster engine for nodal communication systems with additional features for implementing high availability within applications."
arch=('i686' 'x86_64')
url="http://www.corosync.org/"
license=('BSD')
makedepends=('nss' 'libstatgrab' 'net-snmp' 'libdbus' 'libqb')
depends=('nss' 'libstatgrab' 'net-snmp' 'libdbus' 'libqb')
provides=('corosync=2.3.5')
conflicts=('corosync1')
source=("http://build.clusterlabs.org/corosync/releases/corosync-$pkgver.tar.gz"
	"corosync.service")

build() {

	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --sbindir=/usr/bin \
              --sysconfdir=/etc \
	      --libdir=/usr/lib \
              --localstatedir=/var \
              --enable-systemd \
              --enable-monitoring \
              --enable-snmp \
              --enable-dbus \
              --with-systemddir=/usr/lib/systemd/system
  	make

}

package() {

	cd ${srcdir}/${pkgname}-${pkgver}
  	make DESTDIR="${pkgdir}" install

}


md5sums=('8894f00d499e0755467b381e6346f9ff'
         '93d77bf4963852cf842497d5da92dc82')
