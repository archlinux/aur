# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>
pkgname=dnsjit-git
pkgver=v0.9.7.r7.e5c5424
pkgrel=1
pkgdesc="Engine for capturing, parsing and replaying DNS"
arch=('x86_64')
url="https://github.com/DNS-OARC/dnsjit"
license=('GPL3')
depends=(
    'luajit'
    )
makedepends=(
    'git'
    'luajit'
    'libpcap'
    'lmdb'
    'gnutls'
    'libck'
    )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("dnsjit::git+https://github.com/DNS-OARC/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/${pkgname%-git}"
    make -k check
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
