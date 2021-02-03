# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>
pkgname=dnsjit
pkgver=1.1.0
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
    'libuv'
    'libnghttp2'
    )
makedepends=(
    'autoconf'
)
source=("https://github.com/DNS-OARC/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4cd59e3034da484f23392e701e01255175bcd119a6f61b52be3a3950e34d9705')

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
