# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-desktop-bin
pkgver=13.6.2
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=('x86_64')
url="https://github.com/jgraph/drawio-desktop"
license=('Apache')
depends=(
    "gtk3"
    "libxss"
    "nss"
)
provides=('drawio-desktop')
conflicts=('drawio-desktop')
optdepends=()
makedepends=()
source=("${pkgname}-${pkgver}.deb::https://github.com/jgraph/drawio-desktop/releases/download/v${pkgver}/draw.io-amd64-${pkgver}.deb")
sha256sums=('b797657c4d70318096840f7c67a5307197f87fadc37dffbff50d38761eebb318')

prepare() {
    cd "${srcdir}"
    /usr/bin/ar p "${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar xf -
}

package() {
    cd "${srcdir}"
    cp -R opt "${pkgdir}/opt"
    cp -R usr "${pkgdir}/usr"
    chmod 4755 "${pkgdir}/opt/draw.io/chrome-sandbox"
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "/opt/draw.io/drawio" "${pkgdir}/usr/bin/draw.io"
    ln -sf "/opt/draw.io/drawio" "${pkgdir}/usr/bin/drawio"
}
