# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-utc-clock
pkgver=5
pkgrel=1
pkgdesc='Extension for GNOME shell to add a UTC clock to the top bar'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('MPL2')
makedepends=('npm')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/ego-${pkgver}.tar.gz")
sha256sums=('e56a1cd1bf07f9b32c6ea852c5ce91150e04f396204fd55118c84087f0cfb700')

build() {
    cd "${pkgname}-ego-${pkgver}" || exit 1
    npm ci
    make compile
}

package() {
    cd "${pkgname}-ego-${pkgver}" || exit 1
    make PREFIX=/usr DESTDIR="${pkgdir}" install-system
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
