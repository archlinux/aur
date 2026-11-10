# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: rowq  (builds from source)
# AUR page: https://aur.archlinux.org/packages/rowq

pkgname=rowq
pkgver=1.0.1
pkgrel=1
pkgdesc="Query rows in tables, documents and databases from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/rowq"
license=('Apache-2.0')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b39fc33da3f41e6a6638a66ea400e48fc9b6b8a42a03eab47459540a218355d')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen
}

package() {
    cd "$pkgname-$pkgver"

    # Main binary
    install -Dm755 "target/release/rowq" "$pkgdir/usr/bin/rowq"


    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
