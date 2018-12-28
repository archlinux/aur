pkgname='lessfs'
pkgdesc='FUSE-based deduplicating filesystem'
pkgver='1.7.0'
pkgrel='2'
arch=('x86_64' 'i686')
license=('GPL')
depends=('lzo' 'db' 'snappy' 'openssl' 'tokyocabinet' 'fuse' 'mhash')
source=("http://distfiles.gentoo.org/distfiles/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a868b28159fbcd2e7672607d46e3007c7b959bd8c8880b6c98cdab6c61fd104ac222e156f543c2b3e9f9d9fe2f1879c2988ee80605946f03b646481e7c6f15d1')

build () {
	cd "${pkgname}-${pkgver}"
	./configure --with-berkeleydb --with-lzo --with-snappy --with-crypto \
		--prefix=/usr --sbindir=/usr/bin
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
