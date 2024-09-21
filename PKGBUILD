# Maintainer: LekKit <nyandarknessgirl@gmail.com>
# Prev-maintainer: Thermi <noel at familie - kuntze dot de>
pkgname=libqcow
pkgver=20240308
pkgrel=1
pkgdesc="Library and tools to support QEMU copy-on-write image format (QCOW, QCOW2), including a FUSE-based mount utility"
url="https://github.com/libyal/libqcow/"
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
license=('LGPL3')
depends=('fuse' 'openssl')
makedepends=('zlib' 'openssl' 'python')
source=("https://github.com/libyal/libqcow/releases/download/${pkgver}/${pkgname}-alpha-${pkgver}.tar.gz"
        "https://github.com/libyal/libqcow/releases/download/${pkgver}/${pkgname}-alpha-${pkgver}.tar.gz.asc")

validpgpkeys=('0ED9020DA90D3F6E70BD3945D9625E5D7AD0177E')
sha256sums=('f7813b46f46d4d65683f20af073d7362f99202cfdba734211261161806d737b2'
            'SKIP')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-python2 --enable-python3\
	  --enable-verbose-output --enable-debug-output --enable-wide-character-type
	make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
