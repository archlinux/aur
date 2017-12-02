# Maintainer: Claudio d'Angelis <claudiodangelis at gmail dot com>
pkgname=draw.io
pkgver=7.7.3
pkgrel=1
pkgdesc="Flowcharts, process diagrams, org charts, UML, ER and network diagrams"
arch=('x86_64')
url="https://www.draw.io"
license=('MIT')
source=(
    "https://github.com/jgraph/drawio-desktop/releases/download/v${pkgver}/draw.io-amd64-${pkgver}.deb"
)
md5sums=(
    "d9a2e031c2e104b3c57a53692170c281"
)
depends=(gconf libxss libnotify libxtst nss)

package() {
    msg2 "Extracting the data.tar.xz..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    # install -dm755 "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/draw.io/draw.io" "${pkgdir}/usr/bin/draw.io"

    # Chromium License
    install -D -m644 "${pkgdir}/opt/draw.io/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    # Electron License
    install -D -m644 "${pkgdir}/opt/draw.io/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}
