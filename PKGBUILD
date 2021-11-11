# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli
pkgver=0.3.1
pkgrel=2
epoch=
pkgdesc="Syncing dotfiles and more"
arch=("any")
url="https://github.com/blurgyy/dt"
license=('MIT OR Apache 2.0')
groups=()
depends=()
makedepends=(
    cargo
    curl
)
checkdepends=()
optdepends=()
provides=("dt-cli")
conflicts=("dt-cli-git" "dt-cli-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/blurgyy/dt/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/blurgyy/dt/releases/download/v${pkgver}/LICENSE-APACHE"
    "https://github.com/blurgyy/dt/releases/download/v${pkgver}/LICENSE-MIT"
)
sha256sums=(
    "beb2312c6dc6b0a8199eefc49ea492f6c775a6d25d546506a9fa6cc4a6352584"
    "c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c"
    "1aac13b1e305a9a4f6a8a5a7123f3abd092c59b2696d1bde3df32eac0b934322"
)
noextract=()
validpgpkeys=()

prepare() {
    rustup toolchain update stable
}

build() {
    cd "dt-$pkgver"
    cargo +stable build --bin=dt-cli --release --all-features --locked
}

check() {
    cd "dt-$pkgver"
    cargo +stable test --bin=dt-cli --lib=dt-core --release --all-features --locked
}

package() {
    cd "dt-$pkgver"
    install -Dm755 "target/release/dt-cli" "$pkgdir/usr/bin/dt-cli"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/dt/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/dt/LICENSE-MIT"
}
