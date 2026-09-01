# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos
pkgver=0.2.0
pkgrel=1
pkgdesc='Screen annotation tool for niri and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/Treeniks/chameleos'
license=('GPL-3.0-or-later')
depends=('wayland')
makedepends=('cargo' 'rust')
provides=('chameleos' 'chamel')
conflicts=('chameleos-bin' 'chameleos-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=(!debug)
sha256sums=('5ca73c3d8912ff9b2d025c29d7bcaf21dd6f04bb2c657bf3bcf8c92ef216f962')

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
