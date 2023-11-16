# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-utc-clock
pkgver=45.2
pkgrel=1
pkgdesc='Extension for GNOME shell to add a UTC clock to the top bar'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('MPL2')
makedepends=('npm')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3b7b440af66e817be52818636f745f29197aa6669053b804108569e4dfc9a7f3')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    npm ci
    make compile
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make PREFIX=/usr DESTDIR="${pkgdir}" install-system
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
