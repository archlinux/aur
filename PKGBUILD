# Maintainer: Nekef Chk <nekef@duck.com>
pkgname=hashfs
pkgver=1.0.0
pkgrel=1
pkgdesc="A production-grade userspace file system featuring live cryptographic data integrity verification."
arch=('x86_64')
url="https://github.com/nekef/hashfs"
license=('GPL3')
depends=('fuse3')
makedepends=('gcc' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -d -m755 "${pkgdir}/usr/local/bin"

    # Compiles directly from the fetched source files
    gcc -Wall "${srcdir}/mkfs.hashfs.c" -o "${srcdir}/mkfs.hashfs"
    gcc -Wall -I/usr/include/fuse3 "${srcdir}/hashfs.c" -o "${srcdir}/hashfs" -lfuse3

    install -m755 "${srcdir}/hashfs" "${pkgdir}/usr/bin/hashfs"
    install -m755 "${srcdir}/mkfs.hashfs" "${pkgdir}/usr/local/bin/mkfs.hashfs"
}
