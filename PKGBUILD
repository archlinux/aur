# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.14.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell' 'sqlite')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('92a198218a4892a438963ab537bc5f7c9520eace991ef2d18f72d9f4a2332b1a')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    export RUSTFLAGS='--cap-lints=allow'
    make PREFIX="/usr" build
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
