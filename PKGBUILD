# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-utc-clock
pkgver=45.4
pkgrel=2
pkgdesc='Extension for GNOME shell to add a UTC clock to the top bar'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('MPL2')
makedepends=('nodejs')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('69d84fb144ae12d8d0d0dbb4b2d2b3ccf7c7797e684f98389f2af06ce0f18a05')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    mkdir -p "${srcdir}/bin"
    corepack enable --install-directory "${srcdir}/bin" yarn
    export PATH="${srcdir}/bin/:${PATH}"
    yarn install
    make compile
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    export PATH="${srcdir}/bin/:${PATH}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install-system
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
