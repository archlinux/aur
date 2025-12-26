# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=2.5.4
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://codeberg.org/swsnr/gnome-search-providers-vscode"
license=('EUPL-1.2')
depends=('sqlite')
makedepends=('rust' 'just' 'git')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('2115808baf113cb7ca8adb91ee3b6a1c5310dc3bb1f9724e88c351032c9c1907')

prepare() {
    cd "${pkgname}" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}" || exit 1
    just destdir="${pkgdir}" prefix="/usr" install
}
