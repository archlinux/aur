# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-picture-of-the-day
pkgver=45.13
pkgrel=1
pkgdesc='Use a picture of the day from various sources as GNOME desktop background'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('GPL-2.0-or-later OR MPL-2.0')
makedepends=('nodejs')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('18b133d1c82c0b74bf077791160b765cc4d6698d89d88ad2f035425064c2b60c')

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
    make PREFIX=/usr DESTDIR="${pkgdir}" install-package
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
