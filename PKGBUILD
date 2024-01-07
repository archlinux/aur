# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-picture-of-the-day
pkgver=45.12
pkgrel=2
pkgdesc='Use a picture of the day from various sources as GNOME desktop background'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('MPL2')
makedepends=('nodejs')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('11291dc4bd0bf0ac4318e0dc21f1ea5d9db21a13a6cd67130b93d157547576a5')

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
