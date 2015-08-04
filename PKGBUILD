# Maintainer: Thermi <noel at familie-kuntze dot de>

pkgname=ocfs2-tools
pkgver=1.6.4
pkgrel=2
pkgdesc="ocfs2 tool chain by Oracle, including mkfs, tunefs, fsck, debugfs and utilities for ocfs2"
arch=('x86_64' 'i686')
url="https://oss.oracle.com/projects/ocfs2-tools/"
license=('GPL')
optdepends=('pacemaker' 'corosync')
source=(ocfs2-tools.zip::"https://github.com/Thermi/ocfs2-tools/archive/master.zip")

sha256sums=('SKIP')

build() {
	cd "${srcdir}/ocfs2-tools-master/"
	./configure	--prefix=/usr		\
		--sysconfdir=/etc 		\
		--libexecdir=/usr/lib		\
		--sbindir=/usr/bin		\
		--mandir=/usr/share/man		\
		--enable-dynamic-ctl=yes	\
		--enable-dynamic-fsck=yes	
	make ${MAKEFLAGS}
}

package() {
	cd "${srcdir}/ocfs2-tools-master/"
	make DESTDIR=${pkgdir} install 
	mv ${pkgdir}/sbin/* ${pkgdir}/usr/bin/
	rmdir ${pkgdir}/sbin
}
