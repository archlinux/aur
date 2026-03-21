# Maintainer: mfw <espadonne@outlook.com>

pkgname=gump
pkgver=0.2.7
pkgrel=1
pkgdesc='A smarter cd command - directory jumper using frecency'
arch=('x86_64')
url='https://github.com/tenseleyFlow/gump'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('fzf: for interactive selection with gi')
install=gump.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/tenseleyFlow/gump/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ea772635de2eabd7ebdda3b3ad55dc719ba1d64544e2d604b0fcbf0721731cc')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/gump "$pkgdir/usr/bin/gump"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
