# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>
pkgname=dnsjit
pkgver=1.2.1
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
sha256sums=('ecac17974d104c17d1df775c2b548109ad7e53d05fbc2acd823fa43fce330d51')

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
