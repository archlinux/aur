# Maintainer: David McIlwraith <archaios at archaios dot net>
pkgname=libqcow
pkgver=20170222
pkgrel=1
pkgdesc="Library and tools to support QEMU copy-on-write image format (QCOW, QCOW2), including a FUSE-based mount utility"
url="https://github.com/libyal/libqcow/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('fuse' 'openssl')
makedepends=('zlib' 'openssl' 'python')
source=("https://github.com/libyal/libqcow/releases/download/${pkgver}/${pkgname}-alpha-${pkgver}.tar.gz"
        "https://github.com/libyal/libqcow/releases/download/${pkgver}/${pkgname}-alpha-${pkgver}.tar.gz.asc")

validpgpkeys=('0ED9020DA90D3F6E70BD3945D9625E5D7AD0177E')
sha256sums=('8b4a3f97b3091cb8dc4990a03a1c9c42385e37d876eba6e6513b1e9104e9512d'
            'SKIP')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-python --enable-verbose-output --enable-debug-output --enable-wide-character-type
	make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
