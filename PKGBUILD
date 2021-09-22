# Maintainer: hexchain <i at hexchain dot org>

pkgname=mdevctl
pkgver=1.1.0
pkgrel=1
pkgdesc="A mediated device management utility for Linux"
url="https://github.com/mdevctl/mdevctl"
arch=('x86_64')
license=('LGPL2.1')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdevctl/mdevctl/archive/v$pkgver.tar.gz")
sha256sums=('c710a0f7ce9182e574080ae39d21cea92ac28be698ee763b79ccd7f02789d622')
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
