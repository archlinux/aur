# Maintainer: Petr Špaček <pspacek@isc.org>
pkgname=packetq-git
pkgver=1.4.3.r1.948c28e
pkgrel=1
pkgdesc="A tool that provides a basic SQL-frontend to PCAP-files"
arch=('x86_64')
url="https://github.com/DNS-OARC/PacketQ"
license=('GPL3')
depends=(
    'zlib'
    )

makedepends=(
    'autoconf'
    'automake'
    'git'
    'libtool'
    'pkg-config'
    'zlib'
    )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/DNS-OARC/${pkgname%-git}.git#branch=develop")
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
