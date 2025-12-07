# Maintainer: Nickid2018 <nickid2018@outlook.com>
_pkgname='minecraft-ping'
pkgname=minecraft-ping
pkgver=2.1.0
pkgrel=1
pkgdesc="A tool for pinging Minecraft servers"
arch=('x86_64')
url="https://github.com/Nickid2018/minecraft-ping"
license=('MIT')
depends=()
makedepends=(cargo)
source=("https://github.com/Nickid2018/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bc263d0927a7b834b34aaa2653fb06725e61753af86f87dc7d6b03b3bcc0d299')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/mcping"
}
