# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-desktop-bin
pkgver=8.6.5
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=('x86_64')
url="https://github.com/jgraph/drawio-desktop"
license=('apache')
depends=("gconf" "libnotify" "libxtst" "nss" "libxss")
provides=('drawio-desktop')
conflicts=('drawio-desktop')
optdepends=()
makedepends=()
source=("${pkgname}-${pkgver}.deb::https://github.com/jgraph/drawio-desktop/releases/download/v${pkgver}/draw.io-amd64-${pkgver}.deb")
sha256sums=('0f9f522a43049241646fab61b85d36ebbf35e4d0e380e033780931882773a0d2')

prepare() {
    cd "${srcdir}"
    /usr/bin/ar p "${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar xf -
}

package() {
    cd "${srcdir}"
    cp -R opt "${pkgdir}/opt"
    cp -R usr "${pkgdir}/usr"
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "/opt/draw.io/draw.io" "${pkgdir}/usr/bin/draw.io"
}
