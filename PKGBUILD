# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=2.4.1
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-vscode"
license=('MPL-2.0')
depends=('sqlite')
makedepends=('rust')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}-vendor.tar.zstd::${url}/releases/download/v${pkgver}/vendor.tar.zstd"
    "config.toml"
)
sha256sums=('ca4563c3e0dae16913a483e3759e8429b0126885e6db42205f22d69fa91da1c7'
            '8ad6afe5fa36e961184936ccffb64efbbdafc14d516214fa029d595c7ecf9e7c'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881')

prepare() {
    cd "${pkgname}-${pkgver}" || exit 1
    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    make PREFIX="/usr" build
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
