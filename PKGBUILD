# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.16.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-vscode"
license=('MPL-2.0')
depends=('gnome-shell' 'sqlite')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('db3650e25ecd72c58123cec3872576e50598638027f533777db1c80baf0a2f0f')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    export RUSTFLAGS='--cap-lints=allow'
    make PREFIX="/usr" build
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
