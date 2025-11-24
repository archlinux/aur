# Maintainer: Nickid2018 <nickid2018@outlook.com>
_pkgname='minecraft-ping'
pkgname=minecraft-ping
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool for pinging Minecraft servers"
arch=('x86_64')
url="https://github.com/Nickid2018/minecraft-ping"
license=('MIT')
depends=()
makedepends=(cargo)
source=("https://github.com/Nickid2018/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5de73223b471d926ced1f4d969880cda48df9af812a7bfc516c0f3ca11647b5d')

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
