# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=termirs
pkgver=0.2.6
pkgrel=1
pkgdesc="A modern, async SSH terminal client"
url="https://github.com/caelansar/termirs"
license=(MIT)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('1f1a1e954b491c2c7bdc0603b64cc3263327bae5ec6f9938d5761cfed6252c4c')
sha512sums=('e2ebdde6d19ae66be5a6418827266b917070f67ceb7253d1fcbb6ad80336ed274bcc65996fb71b64a3f949addcb2e1631f1e272ca1290578fb50a750115acdbf')
b2sums=('5ed26d11089cc5cd8efa70f418ff3d920e9a90dffdc729b6e4e9287dfd34cfb083fbd1c8cf2ecd62de1cab78f6638708f62f64e3f66c153950db8ea40176f521')
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
