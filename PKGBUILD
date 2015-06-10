# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Aleshus <podskale@fel.cvut.cz>

pkgname=sems
pkgver=1.5.0
pkgrel=1
pkgdesc="Free, high performance, extensible media and application server for SIP (RFC3261) based VoIP services."
url="http://iptel.org/sems"
license=(GPLv2+)
arch=('i686' 'x86_64')
depends=('speex' 'bash' 'python')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
intall=()
source=(http://ftp.iptel.org/pub/sems/sems-$pkgver.tar.gz rc.d-sems patch-Makefile.defs.patch patch-python2.patch)
md5sums=('ec0a88f9081679b3b4ab9d06e84ea759'
	 '01cbd7bc12dd94b35ef9f723156f4105'
	 'dbf2ffd36d0527a8eb24bd4f82736972'
   '47dc4e26f3370b52edf494b7c37b293a')
build() {
	cd ${srcdir}/$pkgname-$pkgver

	msg "Patching..."
	patch Makefile.defs ${srcdir}/patch-Makefile.defs.patch
  patch -Np1 -i "${srcdir}/patch-python2.patch"
  
	msg "Building..."
	make all

	msg "Installing..."
	make DESTDIR=${pkgdir} PREFIX="" install
	rm -rf ${pkgdir}/share

	install -D -m755 ${srcdir}/rc.d-sems ${pkgdir}/etc/rc.d/sems
	mv -b ${pkgdir}/lib/sems/ivr ${pkgdir}/usr/lib/sems/
	rm -rf ${pkgdir}/lib
}

# vim:set ts=2 sw=2 et:
