# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=2.5.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-vscode"
license=('MPL-2.0')
depends=('sqlite')
makedepends=('rust')
source=(
    "${url}/releases/download/v${pkgver}/gnome-search-providers-vscode-v${pkgver}.tar.zst"
    "${pkgname}-${pkgver}-vendor.tar.zst::${url}/releases/download/v${pkgver}/vendor.tar.zst"
    "config.toml"
)
sha256sums=('3895c748c73db6550cf919f64e7862bd66fb92d78e2fdee232375c1cde73e034'
            '56b0c8d6080a89957d7ff4ca6e603f308a9c6deaaf4f9d6068c63f1d27546a2b'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881')

prepare() {
    cd "${pkgname}-v${pkgver}" || exit 1
    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "${pkgname}-v${pkgver}" || exit 1
    make PREFIX="/usr" build
}

package() {
    cd "${pkgname}-v${pkgver}" || exit 1
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
