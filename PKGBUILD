# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots-git
pkgver=0.11.0.r0.2e828e1
pkgrel=2
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://github.com/jmcantrell/${pkgname%-git}"
license=('MIT')
depends=('btrfs-progs')
makedepends=('git' 'scdoc')
checkdepends=('parallel' 'diffutils')
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
