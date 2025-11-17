# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos
pkgver=0.1.0
pkgrel=1
pkgdesc='Screen annotation tool for niri and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/Treeniks/chameleos'
license=('MIT')
depends=('wayland')
makedepends=('cargo' 'rust')
provides=('chameleos' 'chamel')
conflicts=('chameleos-bin' 'chameleos-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
options=(!debug)
sha256sums=('163622f262fbd8851f1e664721407a2233fb080eb37585ecdf02456159d83289')

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
