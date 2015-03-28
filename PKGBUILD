# Maintainer: gls <ghostlovescorebg at gmail dot com>
# Fixed by Thermi <noel at familie-kuntze dot de>
pkgname=pacemaker-stable
pkgver=1.1.12
pkgrel=1
pkgdesc="pacemaker stable package, contains the latest stable version"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/pacemaker/"
license=('GPLv2')
makedepends=('autoconf' 'libxml2' 'libxslt' 'corosync')
#'rpm-org')
provides=('pacemaker')
source=("https://github.com/ClusterLabs/pacemaker/archive/Pacemaker-${pkgver}.tar.gz")
sha256sums=('f5c72b609fac18d362880d120f08f990e8afd9388e6ff86c55cd93900ba54d9c')

prepare() {

	cd ${srcdir}/pacemaker-Pacemaker-${pkgver}
	
	./autogen.sh
}

build() {

	cd ${srcdir}/pacemaker-Pacemaker-${pkgver}

	./configure --sbindir=/usr/bin \
		--sysconfdir=/etc \
		--libdir=/usr/lib \
		--localstatedir=/var \
		--enable-systemd \
		--with-corosync \
		--with-acl \
		--with-snmp \
		--with-cs-quorum

 	make

}

package() {

	cd ${srcdir}/pacemaker-Pacemaker-${pkgver}
  	make DESTDIR="${pkgdir}" install

}
