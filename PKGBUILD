pkgdesc='FUSE-based deduplicating filesystem'
pkgname=lessfs
pkgver=1.7.0
pkgrel=3
arch=(x86_64 i686)
url=https://sourceforge.net/projects/lessfs
license=(GPL-2.0-or-later)
depends=(lzo db snappy fuse mhash tokyocabinet)
source=("$url/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a868b28159fbcd2e7672607d46e3007c7b959bd8c8880b6c98cdab6c61fd104ac222e156f543c2b3e9f9d9fe2f1879c2988ee80605946f03b646481e7c6f15d1')
options=(!lto)

build () {
	cd "${pkgname}-${pkgver}"
	# TODO: Fix build using --with-crypto
	./configure --with-berkeleydb --with-lzo --with-snappy --without-crypto \
		--prefix=/usr --sbindir=/usr/bin
	make CFLAGS="$CFLAGS -fcommon"
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
