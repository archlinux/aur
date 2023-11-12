# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-picture-of-the-day
pkgver=0.4
pkgrel=1
pkgdesc='Use a picture of the day from various sources as GNOME desktop background'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('MPL2')
makedepends=('npm')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c627bb790a140f20453b6c5156398236742a5da32161c40ee14e8f4ae5c4060f')

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
