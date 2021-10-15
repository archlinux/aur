# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-git
pkgver=v0.1.0.62.gfea47a7
pkgrel=2
epoch=
pkgdesc="Syncing dotfiles and more"
arch=("any")
url="https://github.com/blurgyy/dt"
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

build() {
    cd dt
    cargo build --bin=dt-cli --release --all-features
}

check() {
    cd dt
    cargo test --release --all-features
}

package() {
    cd dt
    install -Dm755 "target/release/dt-cli" "$pkgdir/usr/bin/dt-cli"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/dt/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/dt/LICENSE-MIT"
}
