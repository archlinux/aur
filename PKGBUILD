# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots-git
pkgver=0.15.1.r0.9cf5c8e
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://github.com/jmcantrell/${pkgname%-git}"
license=('MIT')
depends=('btrfs-progs')
makedepends=('git' 'scdoc')
checkdepends=('bats-assert' 'bats-file')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}" || return
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

check() {
    cd "$srcdir/${pkgname%-git}" || return
    ./scripts/test
}

prepare() {
    cd "$srcdir/${pkgname%-git}" || return
    PREFIX=/usr ./scripts/prepare
}

build() {
    cd "$srcdir/${pkgname%-git}" || return
    ./scripts/build
}

package() {
    cd "$srcdir/${pkgname%-git}" || return
    DESTDIR=$pkgdir PREFIX=/usr ./scripts/install
}
