# Maintainer: Raphael Bitton <raphael@rbitton.com>
pkgname=worldforge
pkgver=0.4.0
pkgrel=1
pkgdesc="A world simulation engine. Simple rules, emergent civilizations, and a narrative that writes itself."
arch=('x86_64')
url="https://git.skylantix.com/hermes/worldforge"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'rust' 'git')
source=("git+https://git.skylantix.com/hermes/worldforge.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/.cargo"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/worldforge" "$pkgdir/usr/bin/worldforge"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
