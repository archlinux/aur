# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli
pkgver=0.5.1
pkgrel=1
epoch=
pkgdesc="Syncing dotfiles and more"
arch=("any")
url="https://dt.cli.rs"
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
source=("https://github.com/blurgyy/dt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("84def87fa5fdf0452ba6d05c461d94c4b9de933673cec7c74f80e5d5803267ab")
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
