# Maintainer: mfw <espadonne@outlook.com>

pkgname=gump
pkgver=0.1.0
pkgrel=1
pkgdesc='A smarter cd command - directory jumper using frecency'
arch=('x86_64')
url='https://github.com/tenseleyFlow/gump'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('fzf: for interactive selection with gi')
source=("git+https://github.com/tenseleyFlow/gump.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd gump
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd gump
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd gump

    install -Dm755 target/release/gump "$pkgdir/usr/bin/gump"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
