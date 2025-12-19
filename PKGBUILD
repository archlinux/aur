# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=termirs
pkgver=0.2.5
pkgrel=1
pkgdesc="A modern, async SSH terminal client"
url="https://github.com/caelansar/termirs"
license=(MIT)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('76a5d7edbebac293220d60c76791bd272dc615ecd851d1027dfb03d2ccb6c4e1')
sha512sums=('a4869fe6abc1aa1d9dc4fafbc0b9361d3963c8d7abcbd7c7f29002cbef4bde82a0b206978cecbdbbf7150f0fa7044ece8e2764d77403665b5f5e43334c708876')
b2sums=('cef92b22b7a755cbb59dd855d7f8c3d828deecc7a646e1b23023ce785028358b1ed64fa79d0ee78a426d6f35cb0e85fb20400d0df0f4f436273b971ecaea6cde')
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
