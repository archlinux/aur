# Maintainer: Matthieu LAURENT <matthieu.laurent69 [at] proton.me>
# Contributor: Aaron Gross <aaron.gross.codes [at] gmail.com>
# Contributor: Marcel Robitaille <mail [at] marcelrobitaille.me>

pkgname=rust-motd
pkgver=1.0.1
pkgrel=1
pkgdesc='Beautiful, useful, configurable MOTD generation with zero runtime dependencies'
arch=(x86_64)
url=https://github.com/rust-motd/rust-motd
license=(MIT)

provides=($pkgname)
conflicts=($pkgname-bin)
depends=()
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::https://github.com/rust-motd/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f72516241a7b9649c70f905bfae5fb40fc2c900d895a7fcaec66c8a5187da8ee')
options=()

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    cargo build --frozen --release
}

check() {
    cd "$srcdir"/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
