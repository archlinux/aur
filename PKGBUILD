# Maintainer: gls <ghostlovescorebg at gmail dot com>

pkgname=ha-pacemaker-git
_realname=pacemaker
pkgver=Pacemaker.1.1.7.4159.g622f276
pkgrel=2
pkgdesc="Pacemaker is an cluster resource manager"
arch=('i686' 'x86_64')
url="http://linux-ha.org/wiki/Pacemaker"
license=('GPL')
makedepends=('libqb' 'corosync')
#depends=('ha-resourceagent' 'ha-heartbeat' 'libxslt' 'libqb' 'corosync')
depends=('libxslt' 'libqb' 'corosync')
source=("git://github.com/ClusterLabs/pacemaker.git"
	"pacemaker.service")
options=('!libtool' 'docs' 'strip')
md5sums=('SKIP'
         '32b94b2ed9a8b4062cebc042cd402ce3')

pkgver() {
	cd ${srcdir}/${_realname}
	git describe | sed 's/-/./g'

}

build() {
	
	cd $srcdir/pacemaker
	./autogen.sh
	./configure --bindir=/usr/bin --sbindir=/usr/bin
	sed -i 's/\-Werror//g' Makefile configure configure.ac
	make

}

package() {
	
	cd ${srcdir}/${_realname}
	make PREFIX=/usr DESTDIR="$pkgdir" install
	cp ${srcdir}/pacemaker.service ${pkgdir}/usr/lib/systemd/system/

}
