# Maintainer: Wren Arco <wren.arco@gmail.com>
pkgname=vesper-audio-ctl
pkgver=0.1.0
pkgrel=1
pkgdesc="Audio control tool for PipeWire/PulseAudio"
arch=('x86_64')
url="https://github.com/Rinzlo/audio-ctl"
license=('MIT')
depends=('libpulse')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('33e6847b1e4c6548b7f786b36b0129f33361351a23449a5fdcbb82eddd2802ce')

prepare() {
    cd "audio-ctl-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "audio-ctl-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "audio-ctl-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "audio-ctl-$pkgver"
    install -Dm755 target/release/audio "$pkgdir/usr/bin/audio"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
