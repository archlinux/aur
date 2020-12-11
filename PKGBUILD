# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Haruue Icymoon <i@haruue.moe>

pkgname=erofs-utils
pkgver=1.2
pkgrel=1
pkgdesc='Userspace utilities for linux-erofs file system'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git'
license=('GPL2')
depends=('lz4>=1:1.9.3' 'util-linux-libs')
makedepends=('util-linux')
source=("https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-${pkgver}.tar.gz"
        '0001-erofs-utils-fix-multiple-definition-of-sbi.patch::https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=ac0d13efa1fe673e677343cda4795d820500da6b'
        '0002-erofs-utils-mkfs-fix-uuid.h-location.patch::https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=2241f1616fc52f1e10aef0de4f53bb14d70b87d0')
sha512sums=('167311beb2d4722436051956076d670f6a54da72e1690d19d43e0c46dd972f9f61427b4792b469813a6a4ff2e3c445646cf063d37b4ee2b52f88eb14e7bf2713'
            'da4b2718699e846413fe6cd46e97c71d7c86e3fc3057f0c26eea56434131ccf07c8cc35a38dc52c7928e791a8cabf1dd483ff04c7cffcba1c35d57d0860ac274'
            '4e190b81d72b2432e3936c42a5dbe15cf323d011f5da88ac40162e10179bd3a686b9083d5b5c7583c3a397955da6cf6a54d0ddb8a06087ad8662c26ee6a5b643')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i ../0001-erofs-utils-fix-multiple-definition-of-sbi.patch
	patch -Np1 -i ../0002-erofs-utils-mkfs-fix-uuid.h-location.patch
}

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
