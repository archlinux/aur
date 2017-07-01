# Maintainer: Thermi <noel at familie-kuntze dot de>

pkgname=ocfs2-tools
pkgver=1.8.5
pkgrel=1
pkgdesc="ocfs2 tool chain by Oracle, including mkfs, tunefs, fsck, debugfs and utilities for ocfs2"
arch=("x86_64" "i686")
url="https://github.com/markfasheh/ocfs2-tools/"
license=("GPL2")
optdepends=("pacemaker" "corosync")
makedepends=("automake")
source=("https://github.com/markfasheh/ocfs2-tools/archive/ocfs2-tools-${pkgver}.tar.gz"
        "2125-Makefile-allow-parallel-builds.patch")

sha256sums=('ccf8bf8a2cccad841a96b41e0a858194ec61e8a765065630595d4218e9008569'
            '8bab7feb2184c193df963e13963647e9fff5b09ecce62d5d0253e85009a5fb83')

prepare() {
    # Upstream packaged it like that, it"s not a problem in this PKGBUILD.
    cd "${srcdir}/ocfs2-tools-ocfs2-tools-${pkgver}"
    patch -p1 <"${srcdir}/2125-Makefile-allow-parallel-builds.patch"
}
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
