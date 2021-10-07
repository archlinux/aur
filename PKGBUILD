# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-git
pkgver=v0.1.0.10.g450a984
pkgrel=1
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
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/dt/LICENSE"
}
