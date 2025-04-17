# Maintainer: Nicki Krizek <nicki@isc.org>
pkgname=dnsjit
pkgver=1.5.0
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
sha256sums=('24666ba4b6147a59c01add990185e455c4568697e869fe8dff5cded5ebeef032')

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
