# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
pkgname=typstyle
pkgver=0.11.28
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
depends=("gcc-libs" "glibc")
makedepends=('cargo')
optdepends=("typst: For typst compilation")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4b35da6fe3c4a652a3afb493d9f28edf64e46631b1dba7c7727e669e57afd019')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=cli
}

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
