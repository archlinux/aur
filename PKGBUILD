# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-git
pkgver=git
pkgrel=1
epoch=
pkgdesc="\$HOME, \$HOME everywhere"
arch=("any")
url="https://dt.cli.rs"
license=('MIT OR Apache 2.0')
groups=()
depends=()
makedepends=(
    git
    cargo
)
checkdepends=()
optdepends=()
provides=("dt-cli")
conflicts=("dt-cli" "dt-cli-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/blurgyy/dt.git")
sha256sums=("SKIP")
noextract=()
validpgpkeys=()

pkgver() {
    git -C dt describe | sed 's:-:.:g'
}

prepare() {
    rustup toolchain update stable
}

build() {
    cd dt
    cargo +stable build --bin=dt-cli --release --all-features --locked
}

check() {
    cd dt
    cargo +stable test --bin=dt-cli --lib=dt-core --release --all-features --locked
}

package() {
    cd dt
    install -Dm755 "target/release/dt-cli" "$pkgdir/usr/bin/dt-cli"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/dt/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/dt/LICENSE-MIT"
}
