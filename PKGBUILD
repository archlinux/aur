# Maintainer: Stephen <stephen.thomasdorin@gmail.com>
pkgname=audio-select
pkgver=0.1.0
pkgrel=1
pkgdesc='Quick and rusty pulseaudio device selection app'
url='https://github.com/sk8ersteve/audio-select'
source=("$pkgname-$pkgver.tar.gz::https://github.com/sk8ersteve/audio-select/archive/v$pkgver.tar.gz")
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
sha256sums=('874a71c038291df569593e58a09904af1fffb96823abfb6c5ffe6461c6444529')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
