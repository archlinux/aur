# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=2.5.3
pkgrel=2
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://codeberg.org/swsnr/gnome-search-providers-vscode"
license=('EUPL-1.2')
depends=('sqlite')
makedepends=('rust' 'just' 'git')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('aa910f15364fb50e9e28ab80401f13d764be293a3ae34386aad6579dca138b4f')

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
