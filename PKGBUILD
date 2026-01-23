# Maintainer: ReubenPercy / reubenpercival14@gmail.com
pkgname=rustmap
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight, fast, and easy-to-use port scanner written in Rust"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://codeberg.org/akirathelinuxguy/rustmap"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+https://codeberg.org/akirathelinuxguy/rustmap.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/rustmap"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/rustmap"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "$srcdir/rustmap"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features || true
}

package() {
    cd "$srcdir/rustmap"
    install -Dm755 "target/release/rustmap" "$pkgdir/usr/bin/rustmap"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
