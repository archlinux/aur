# Maintainer: Thermi <noel at familie-kuntze dot de>

pkgname=ocfs2-tools
pkgver=1.8.6
pkgrel=2
pkgdesc="ocfs2 tool chain by Oracle, including mkfs, tunefs, fsck, debugfs and utilities for ocfs2"
arch=("x86_64" "i686")
url="https://github.com/markfasheh/ocfs2-tools/"
license=("GPL2")
optdepends=("pacemaker" "corosync")
makedepends=("automake" "libaio")
source=("https://github.com/markfasheh/ocfs2-tools/archive/ocfs2-tools-${pkgver}.tar.gz")
md5sums=('fc64af70a6a2533948f47fa9cb2fc1c4')

build() {
	# Upstream packaged it like that, it"s not a problem in this PKGBUILD.
	cd "${srcdir}/ocfs2-tools-ocfs2-tools-${pkgver}/"

	./autogen.sh --prefix=/usr 		\
		--sysconfdir=/etc 			\
		--libexecdir=/usr/lib		\
		--sbindir=/usr/bin			\
		--mandir=/usr/share/man		\
		--enable-dynamic-ctl=yes	\
		--enable-dynamic-fsck=yes
	make
}

package() {
    # Upstream packaged it like that, it"s not a problem in this PKGBUILD.
	cd "${srcdir}/ocfs2-tools-ocfs2-tools-${pkgver}/"
	make DESTDIR=${pkgdir} install 
	mv ${pkgdir}/sbin/* ${pkgdir}/usr/bin/
	rmdir ${pkgdir}/sbin
}
