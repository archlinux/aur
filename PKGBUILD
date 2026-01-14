# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname=envy-tui
pkgver=0.1.2
pkgrel=1
pkgdesc="A Terminal User Interface (TUI) manager for EnvyControl"
arch=('x86_64')
url="https://github.com/tassiovirginio/envy-tui"
license=('MIT') 
depends=('envycontrol')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f5ece0ff3a438026d296ba1ab2f807d1a491bbc7c14ca235770bb10ebc8633e3')

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

