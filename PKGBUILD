# Maintainer: Tom Krizek <tkrizek@isc.org>
pkgname=dnsjit
pkgver=1.3.0
pkgrel=1
pkgdesc="Engine for capturing, parsing and replaying DNS"
arch=('x86_64')
url="https://github.com/DNS-OARC/dnsjit"
license=('GPL3')
depends=(
    'luajit'
    'libpcap'
    'lmdb'
    'gnutls'
    'libck'
    'lz4'
    'zstd'
    )
makedepends=(
    'autoconf'
)
source=("https://github.com/DNS-OARC/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b12d2ea95cd7bf3f6f9d832033f3c68280d379f7f4af1f7716414459b37b653a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
