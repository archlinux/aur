# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-desktop-bin
pkgver=7.1.0
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=('x86_64')
url="https://github.com/jgraph/drawio-desktop"
license=('apache')
depends=("gconf" "libnotify" "libxtst" "nss" "libxss")
optdepends=()
makedepends=()
source=("${pkgname}-${pkgver}.deb::https://github.com/jgraph/drawio-desktop/releases/download/v${pkgver}/draw.io-amd64-${pkgver}.deb")
sha256sums=('75f0c3a69b28de2a2bb68c11562f645df9321358e3164923445d0911ce6b4355')

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
