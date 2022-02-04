# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli
pkgver=0.7.1
pkgrel=1
epoch=
pkgdesc="\$HOME, \$HOME everywhere"
arch=("any")
url="https://dt.cli.rs"
license=('MIT OR Apache 2.0')
groups=()
depends=()
makedepends=(
    rustup
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
)
sha256sums=(
    "8310163e47b21646eee03c7d96d0e0ac177958d5c7032e6988cac833db391ca6"
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
