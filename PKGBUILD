# Maintainer: Tony <tony@libpcap.net>

pkgname=rocksdb-static
pkgver=7.9.2
pkgrel=1
pkgdesc='Embedded key-value store for fast storage (static library)'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=('Apache')
depends=('gperftools' 'zlib' 'bzip2' 'lz4' 'snappy' 'gcc-libs')
checkdepends=('python')
source=("https://github.com/facebook/rocksdb/archive/v${pkgver}.tar.gz"
        "fix-uninitialized-read_req.patch")
sha256sums=('886378093098a1b2521b824782db7f7dd86224c232cf9652fcaf88222420b292'
            '244fdbe8e4a07dbf54da0f1e90322585eb1d5fbd1906cc09fd154bb200cb694b')

build() {
    cd "${srcdir}/rocksdb-${pkgver}"

    env USE_RTTI=1 DISABLE_WARNING_AS_ERROR=1 \
        make static_lib
}

package() {
    cd "${srcdir}/rocksdb-${pkgver}"

    install -Dm755 librocksdb.a "${pkgdir}"/usr/lib/librocksdb.a
    install -Dm644 LICENSE.Apache "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Apache"
    install -Dm644 LICENSE.leveldb "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.leveldb"
}
