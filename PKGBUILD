# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>
pkgname=dnsjit-git
pkgver=1.2.1.r1.d78c34f
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
    'git'
    )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/DNS-OARC/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    make -k check
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}/" install
}
