# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos
pkgver=0.1.0
pkgrel=2
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
sha256sums=('c12420c27d7d85df3749461baaa095df7a469c3f1a453ea27f29490bacbfaed2')

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
