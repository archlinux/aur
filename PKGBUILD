# Maintainer: backmeupplz <backmeupplz@gmail.com>
pkgname=drumkit
pkgver=0.1.0
pkgrel=1
pkgdesc='Low-latency TUI MIDI drum sampler for electronic drum kits'
arch=('x86_64')
url='https://github.com/backmeupplz/drumkit'
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/drumkit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ab66216aa6b0fece82bd221951a59fa336ba4e334640827a9a9511c8388915d')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
