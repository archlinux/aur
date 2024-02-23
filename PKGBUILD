# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-disable-extension-updates
pkgver=45.2
pkgrel=1
pkgdesc='Extension for GNOME shell to disable the automatic update check'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('GPL-2.0-or-later OR MPL-2.0')
makedepends=('nodejs')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f75e6e0854b54117f1545c2d47a9c80e2c68bb2776fdca092f759f38a9bacab7')

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
