# Maintainer: Tony <tony@libpcap.net>

pkgname=rocksdb-static
pkgver=7.1.2
pkgrel=1
pkgdesc='Embedded key-value store for fast storage (static library)'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=('Apache')
depends=('gperftools' 'zlib' 'bzip2' 'lz4' 'snappy' 'gcc-libs')
checkdepends=('python')
source=("https://github.com/facebook/rocksdb/archive/v${pkgver}.tar.gz")
sha256sums=('4dded5503a87098d55084dbb1f88eebbf1078ea4b827e9508fdb4c9fccb98977')

build() {
    cd "${srcdir}/rocksdb-${pkgver}"

    env USE_RTTI=1 make static_lib
}

package() {
    cd "${srcdir}/rocksdb-${pkgver}"

    install -Dm755 librocksdb.a "${pkgdir}"/usr/lib/librocksdb.a
    install -Dm644 LICENSE.Apache "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Apache"
    install -Dm644 LICENSE.leveldb "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.leveldb"
}
