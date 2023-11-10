# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-picture-of-the-day
pkgver=0.2
pkgrel=2
pkgdesc='Use a picture of the day from various sources as GNOME desktop background'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('MPL2')
makedepends=('npm')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('233e43dda13ed12f5a99769056ce837092bbdb27849f0b78c8c56e338568046d')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    npm ci
    make compile
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make PREFIX=/usr DESTDIR="${pkgdir}" install-package
    rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
