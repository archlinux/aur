# Maintainer: hexchain <i at hexchain dot org>

pkgname=mdevctl
pkgver=1.0.0
pkgrel=1
pkgdesc="A mediated device management utility for Linux"
url="https://github.com/mdevctl/mdevctl"
arch=('x86_64')
license=('LGPL2.1')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdevctl/mdevctl/archive/v$pkgver.tar.gz")
sha256sums=('a6173629e689fa2532a57a63b947ed44d5a69367d0e3d15023d0ff88f41a585f')
options+=(emptydirs)

build() {
    cd "$pkgname-$pkgver"
    env CARGO_INCREMENTAL=0 cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" SBINDIR="/usr/bin" install
}
