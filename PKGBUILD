# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.12.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell' 'sqlite')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cc6886ecef2729d9d1df3200d602761565f91a998a32a7e7a847012bd147e438')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    export RUSTFLAGS='--cap-lints=allow'
    make PREFIX="/usr" build
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
