# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=cubiomes-viewer
pkgver=1.8.0
pkgrel=1
pkgdesc="An efficient graphical Minecraft seed finder and map viewer"
arch=("x86_64")
url="https://github.com/Cubitect/cubiomes-viewer"
license=('GPL3')
depends=("qt5-base")
makedepends=("gendesk")
source=("https://github.com/Cubitect/cubiomes-viewer/releases/download/${pkgver}/cubiomes-viewer-${pkgver}-src.tar.gz")
sha256sums=("6464d633e84aa9cb0b361283a1b6470599c5059fc82ce5a796e51c1c08a257b2")

build() {
    mkdir -p cubiomes-viewer/build
    cd cubiomes-viewer/build
    qmake ..
    make
}

package() {
    install -Dm755 "cubiomes-viewer/build/cubiomes-viewer" "${pkgdir}/usr/bin/cubiomes-viewer"
    install -Dm644 "cubiomes-viewer/icons/map.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --pkgname "${pkgname}" \
        --pkgdesc "$pkgdesc" \
        --name "Cubiomes Viewer" \
        --comment "$pkgdesc" \
        --exec "cubiomes-viewer" \
        --categories "Game"  \
        --icon "${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "cubiomes-viewer/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
