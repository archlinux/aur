# Maintainer: Petr Spacek <pspacek@isc.org>
pkgname=dnsjit-git
pkgver=1.5.0.r11.505e23c
pkgrel=1
pkgdesc="Engine for capturing, parsing and replaying DNS"
arch=('x86_64')
url="https://codeberg.org/DNS-OARC/dnsjit"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'gnutls'
    'libck'
    'libpcap'
    'lmdb'
    'luajit'
    'lz4'
    'xz'
    'zlib'
    'zstd'
    )
makedepends=(
    'autoconf'
    'git'
    )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://codeberg.org/DNS-OARC/${pkgname%-git}.git")
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
