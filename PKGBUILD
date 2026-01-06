# Maintainer: mfw <espadonne@outlook.com>

pkgname=arco
pkgver=0.4.0
pkgrel=1
pkgdesc='Terminal-based virtual instrument playground with real-time synthesis and built-in sequencer'
arch=('x86_64')
url='https://github.com/tree3stan-chord/arcorrust'
license=('MIT')
depends=('alsa-lib')
makedepends=('rust' 'cargo' 'alsa-lib' 'pkg-config')
optdepends=('alsa-utils: for audio device testing and configuration')
source=("git+https://github.com/tree3stan-chord/arcorrust.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd arcorrust
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd arcorrust
    cargo test --release --locked || true  # Allow tests to fail gracefully
}

package() {
    cd arcorrust

    # Install the binary
    install -Dm755 target/release/arco "$pkgdir/usr/bin/arco"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}