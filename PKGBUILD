# Maintainer: Nekef Chk <nekef@duck.com>
pkgname=hashfs
pkgver=1.0.2
pkgrel=1
pkgdesc="A production-grade userspace file system featuring live cryptographic data integrity verification."
arch=('x86_64')
url="https://github.com/nekef/hashfs"
license=('GPL3')
depends=('fuse3')
makedepends=('gcc' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    gcc -Wall mkfs.hashfs.c -o mkfs.hashfs
    gcc -Wall -I/usr/include/fuse3 hashfs.c -o hashfs -lfuse3
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -d -m755 "${pkgdir}/usr/local/bin"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -m755 hashfs "${pkgdir}/usr/bin/hashfs"
    install -m755 mkfs.hashfs "${pkgdir}/usr/local/bin/mkfs.hashfs"
}
