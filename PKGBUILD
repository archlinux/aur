# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname=envy-tui
pkgver=0.1.4
pkgrel=1
pkgdesc="A Terminal User Interface (TUI) manager for EnvyControl"
arch=('x86_64')
url="https://github.com/tassiovirginio/envy-tui"
license=('MIT') 
depends=('envycontrol')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e72cf0213f3e5a88d3ee07a917bc0137c912aef529b10d92af40dda6a0c261b5')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

