# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-desktop-bin
pkgver=7.8.4
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=('x86_64')
url="https://github.com/jgraph/drawio-desktop"
license=('apache')
depends=("gconf" "libnotify" "libxtst" "nss" "libxss")
optdepends=()
makedepends=()
source=("${pkgname}-${pkgver}.deb::https://github.com/jgraph/drawio-desktop/releases/download/v${pkgver}/draw.io-amd64-${pkgver}.deb")
sha256sums=('3432a58d1bbb19e736c514438d48f0f7f66762bf5a8dde722b5f722050377879')

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
