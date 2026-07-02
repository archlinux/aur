# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: SaltedFish
# This is made by storycraft (Github) so all credit goes to them. I (SaltedFish) am just uploading it to AUR. My reddit is u/Salted_Fsh

pkgname=xp3-tool
pkgver=0.2.1
pkgrel=3
_commit=cf806f9
pkgdesc="A simple tool for packing and unpacking .xp3 files"
arch=(x86_64)
url="https://github.com/storycraft/xp3-tool"
license=(MIT)
depends=(libgcc_s.so)
makedepends=(cargo git)
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('e2116ceec4ee7ad536b08a4b9f87da37dcf83b00585c859d087552d459362044')
validpgpkeys=(551EF2D95F38E925DA6CD3CC788FDD29187C3233)

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/xp3-{,un}packer -t "$pkgdir/usr/bin/"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
