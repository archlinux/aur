# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-picture-of-the-day
pkgver=45.6
pkgrel=1
pkgdesc='Use a picture of the day from various sources as GNOME desktop background'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('MPL2')
makedepends=('npm')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('20fd1c1243beb6b005515c68500f2b9aaab13cdffe9a9f44dd2a30df87a83720')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    npm ci
    make compile
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make PREFIX=/usr DESTDIR="${pkgdir}" install-package
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
