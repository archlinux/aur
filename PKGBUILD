# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Haruue Icymoon <i@haruue.moe>

pkgname=erofs-utils
pkgver=1.2.1
pkgrel=1
pkgdesc='Userspace utilities for linux-erofs file system'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git'
license=('GPL2')
depends=('lz4>=1:1.9.3' 'util-linux-libs')
makedepends=('util-linux')
source=("https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-${pkgver}.tar.gz")
sha512sums=('1b0fae6f1d7a5ee01f65e71e389c474d596be8800087beb063bfbda471c54d76f9d3f08da645cecb613b637044ff3f6b19d3c8647425261cec1646c87ad57802')

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
