# Maintainer: Nicki Krizek <nicki@isc.org>
pkgname=dnsjit
pkgver=1.5.1
pkgrel=2
pkgdesc="Engine for capturing, parsing and replaying DNS"
arch=('x86_64')
url="https://www.dns-oarc.net/tools/dnsjit"
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
source=("https://www.dns-oarc.net/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ab52a6ab66cb99038287cdeaba7c8154790d3b1a91c213799dd6ce327a25f0ec3b2ade64727115a9c9f51ccbdba94d50b7dd079337407a887a350ae366e08571')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
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
