# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=termirs
pkgver=0.2.10
pkgrel=1
pkgdesc="A modern, async SSH terminal client"
url="https://github.com/caelansar/termirs"
license=(MIT)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('8970b46ea9ae5ea1782110aabd58fb088590b33d961f56e2e9c2927d7a677873')
sha512sums=('03ad0171a0e16d9c582c292f4d57b99b10705bb1cb24bedde635aee79a7b724bc082bdf55167c2c1f7f0f209f962a8d3245871e7aacad35b3e1b033d2c9724d9')
b2sums=('3ae0044525516f18a5f7f57334962ac2d39ae5817e1d3daa18084b22adbee22dbf3c56133bb8c8a5ce72888c32d6d1d35ef8106281389902af10e89a1b9ecd08')
arch=(x86_64)
makedepends=(git cargo)
provides=("termirs=$pkgver")
conflicts=(termirs)
options=(!debug !lto)

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/termirs"
}
