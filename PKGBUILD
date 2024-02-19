# Maintainer:
# Contributor: Animo Solutions contact@animo.id

pkgname=siera
pkgver=0.2.0
pkgrel=2
pkgdesc="CLI tool to interact with an Aries agent"
arch=(x86_64)
url="https://github.com/animo/siera-cli"
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4315c22d10219771d40be80c463d66eaa6bbc00e165d7302ac1fb96a38b5847')

prepare() {
    cd "siera-cli-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "siera-cli-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "siera-cli-${pkgver}"
    install -Dm755 -t "$pkgdir/usr/bin" target/release/siera
}
