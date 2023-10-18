# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-disable-extension-updates
pkgver=2
pkgrel=1
pkgdesc='Extension for GNOME shell to disable the automatic update check'
arch=('any')
url="https://github.com/swsnr/${pkgname}"
license=('MPL2')
makedepends=('npm')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/ego-${pkgver}.tar.gz")
sha256sums=('a53bb62c201c8869ca447599adc1e56bb0afe93148171e2816ee54d5708ab2d3')

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
