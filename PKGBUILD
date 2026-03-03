# Maintainer: Felix Wolff <lixissimus at gmail dot com>

pkgname=interception-fluent
pkgver=0.4.0
pkgrel=1
pkgdesc='Interception plugin that allows to create arbitrary shortcuts'
url='https://github.com/Lixissimus/fluent'
license=(GPL-3.0-only)
makedepends=(
    'cargo'
    'git'
)
depends=('interception-tools')
arch=('x86_64')
source=("fluent.tar.gz::https://github.com/Lixissimus/fluent/releases/download/v$pkgver/fluent-v$pkgver.tar.gz")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/fluent"
    install -Dm0644 -t "$pkgdir/etc/interception/udevmon.d/" "data/etc/interception/udevmon.d/fluent.yaml"
}
sha256sums=('70af2a93cbf5b38d91a3a68b946b76a0b2afad23fcd5ac18e1941f8580211926')
