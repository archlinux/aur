# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=libntfs-3g
_pkgname=ntfs-3g_ntfsprogs
pkgver=2016.2.22
pkgrel=1
pkgdesc='NTFS filesystem library and development headers. Does not include FUSE driver or utilities.'
url='http://www.tuxera.com/community/open-source-ntfs-3g/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('util-linux')
source=("http://tuxera.com/opensource/${_pkgname}-${pkgver}.tgz")
sha1sums=('382df40c366711003cf24d2342033c23e2580b42')

conflicts=('ntfs-3g')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--disable-ldconfig \
		--disable-static \
		--without-fuse \
		--enable-posix-acls \
		--disable-ntfs-3g \
		--disable-ntfsprogs \
		--disable-extras \
		--disable-quarantined \

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" rootlibdir=/usr/lib install
}
