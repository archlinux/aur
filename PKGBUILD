# Maintainer: hexchain <i at hexchain dot org>

pkgname=mdevctl
pkgver=1.2.0
pkgrel=1
pkgdesc="A mediated device management utility for Linux"
url="https://github.com/mdevctl/mdevctl"
arch=('x86_64')
license=('LGPL2.1')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'python-docutils' 'systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdevctl/mdevctl/archive/v$pkgver.tar.gz")
sha256sums=('42b4f734eae9a43760fb26d49abf8c47153bc217d3f859b6a67cb45f186dd487')
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
