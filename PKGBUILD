# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-utc-clock
pkgver=2
pkgrel=1
pkgdesc='Extension for GNOME shell to add a UTC clock to the top bar'
arch=('any')
url="https://github.com/swsnr/gnome-shell-extension-utc-clock"
license=('MPL2')
makedepends=('npm')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/ego-${pkgver}.tar.gz")
sha256sums=('461fc82c64090abd6c4044b286114a23e35d52b0d119e4128d8c404e8fc66d3c')

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
