# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>
pkgname=dnsjit
pkgver=1.0.0
pkgrel=1
pkgdesc="Engine for capturing, parsing and replaying DNS"
arch=('x86_64')
url="https://github.com/DNS-OARC/dnsjit"
license=('GPL3')
depends=(
    'luajit'
    )
makedepends=(
    'luajit'
    'libpcap'
    'lmdb'
    'gnutls'
    'libck'
    'libuv'
    )
source=("https://github.com/DNS-OARC/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cd3a0052e16aaa8d9acf23aa90277928e9d2bf45bc5f50c694b2330b2482a007')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
