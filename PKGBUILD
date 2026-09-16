# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.16.0
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
depends=('btrfs-progs')
makedepends=('scdoc')
checkdepends=('bats-assert' 'bats-file')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cab68c9debee51453f89d9a3a13838f833a734484a779205f030f8534eca2b76')

check() {
    cd "$srcdir/$pkgname-$pkgver" || return
    ./scripts/test
}

prepare() {
    cd "$srcdir/$pkgname-$pkgver" || return
    PREFIX=/usr ./scripts/prepare
}

build() {
    cd "$srcdir/$pkgname-$pkgver" || return
    ./scripts/build
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || return
    DESTDIR=$pkgdir PREFIX=/usr ./scripts/install
}
