# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos
pkgver=0.1.2
pkgrel=1
pkgdesc='Screen annotation tool for niri and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/Treeniks/chameleos'
license=('MIT')
depends=('wayland')
makedepends=('cargo' 'rust')
provides=('chameleos' 'chamel')
conflicts=('chameleos-bin' 'chameleos-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=(!debug)
sha256sums=('9bb836b07d4c79bda3a824f2b21a545df3d28fd96c61ce31374b1bf56d8b8953')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "target/release/chameleos" "$pkgdir/usr/bin/chameleos"
    install -Dm755 "target/release/chamel" "$pkgdir/usr/bin/chamel"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
