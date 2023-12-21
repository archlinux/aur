# Maintainer: Stephen <stephen.thomasdorin at gmail.com>
pkgname=audio-select
pkgver=0.1.1
pkgrel=1
pkgdesc='Quick and rusty pulseaudio device selection app'
url='https://github.com/sk8ersteve/audio-select'
source=("$pkgname-$pkgver.tar.gz::https://github.com/sk8ersteve/audio-select/archive/v$pkgver.tar.gz")
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
sha256sums=('0cd91e0a3d1901d669b98fb7b85670726a794c70aa0cad837b33912d19a84ca5')

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
