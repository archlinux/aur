# Maintainer: sh0rez <me@sh0rez.de>
pkgname=otel-weaver
pkgver=0.14.0
pkgrel=1
pkgdesc="OpenTelemetry Weaver"
arch=('aarch64' 'x86_64')
url="https://github.com/open-telemetry/weaver"
license=('Apache')
provides=('weaver')
conflicts=('weaver')
source=("https://github.com/open-telemetry/weaver/archive/refs/tags/v$pkgver.tar.gz")
makedepends=(cargo)
sha256sums=('a4989ca0325dbd28001b7881df8dacec993b3b7c3360a717a17e792962e6d09e')

prepare() {
    cd weaver-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd weaver-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd weaver-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/weaver"
}
