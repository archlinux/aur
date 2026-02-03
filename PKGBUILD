# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=termirs
pkgver=0.2.7
pkgrel=1
pkgdesc="A modern, async SSH terminal client"
url="https://github.com/caelansar/termirs"
license=(MIT)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('0e0e45041cdbd6206d82b1e5f1642b02fef590e4037a1401a2389f17df3b49e8')
sha512sums=('bb7f24fd3f111841e3a5fce600f2ec7d284c4a465acc4087238ad668de40abdb903d08a174d3554c4e9d1e6ad77e931d72e53bc7525c421bb34087578f7e8d07')
b2sums=('8fe23f31749a078413d268fa526029c9559a3f154ff1d9f0f6a7849268fdbe9a7e8f5833a947cde2be38a316c174d134810b6ac35d3d6fc57a6c7805305fb139')
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
