# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Haruue Icymoon <i@haruue.moe>

pkgname=erofs-utils
pkgver=1.1
pkgrel=1
pkgdesc='Userspace utilities for linux-erofs file system'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git'
license=('GPL2')
depends=('lz4>=1.8.0' 'util-linux-libs')
source=("https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-${pkgver}.tar.gz")
sha512sums=('f300b536f0ba91a05a7eb3dc9a9ec402c98966ad7c0e1f2f664a650caaffce6c4433722374418c6d03e69ce2e74785e55f9bcc45e6717a8bc67e5352e450806b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr --with-lz4-libdir=/usr/lib
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
