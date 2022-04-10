# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli
pkgver=0.7.7
pkgrel=1
epoch=
pkgdesc="Dotfile management and templating client"
arch=("any")
url="https://dt.cli.rs"
license=('MIT OR Apache 2.0')
groups=()
depends=()
makedepends=(
    'rust'
    'cargo'
    'git'
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
)
b2sums=(
    'b19a9ca67820b1eb7059e1294821e331c8e9dd0771730eae7766110d941a187017ad0ef1433042d322e97b88ec9c2c8f1c19a182d83aa7d5f335f50185411f90'
)
noextract=()
validpgpkeys=()

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
