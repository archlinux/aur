# Maintainer: nihilok <https://github.com/nihilok>
pkgname=runtool
pkgver=0.8.0
pkgrel=1
pkgdesc="A.K.A. run - the bridge between human and AI tooling"
arch=('x86_64' 'aarch64')
url="https://github.com/nihilok/run"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nihilok/run/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fde59fb964a8cd1e813b6a8de26ece2abde63b5ead13d1d2998586da41d7e1fe')

prepare() {
    cd "run-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "run-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --package run
}

package() {
    cd "run-$pkgver"
    install -Dm0755 "target/release/run" "$pkgdir/usr/bin/run"
    install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
