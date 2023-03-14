# Maintainer: Danny <weresocool@xasopheno.com>
pkgname=weresocool
pkgver=1.0.44
pkgrel=1
pkgdesc="*** WereSoCool __!Now In Stereo!__ *** Make cool sounds. Impress your friends/pets/plants"
url="https://github.com/xasopheno/weresocool"
license=("GPL-3.0")
arch=("x86_64")
depends=("portaudio" "pkg-config" "lame" "vorbis-tools")
makedepends=("cargo" "portaudio" "pkg-config" "lame" "vorbis-tools")
provides=("weresocool") 
source=("git+https://github.com/xasopheno/weresocool#tag=v"$pkgver"")
sha512sums=('SKIP')


prepare() {
    cd weresocool && cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    (git describe --long --tags || echo "$pkgver") | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd weresocool && cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd weresocool && cargo test --frozen
}

package() {
    cd weresocool && install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

