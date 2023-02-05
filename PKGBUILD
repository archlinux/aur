# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=cubiomes-viewer
pkgver=3.1.0
pkgrel=1
pkgdesc="An efficient graphical Minecraft seed finder and map viewer"
arch=("x86_64")
url="https://github.com/Cubitect/cubiomes-viewer"
license=('GPL3')
depends=("qt5-base")
makedepends=("gendesk" "qt5-tools")
source=("https://github.com/Cubitect/cubiomes-viewer/releases/download/${pkgver}/cubiomes-viewer-${pkgver}-src.tar.gz")
sha256sums=("c4597cca16248972c68d901383a5fdb06db2866393186c3c1e62d3577864ef57")

build() {
    mkdir -p cubiomes-viewer/build
    cd cubiomes-viewer/build
    qmake CONFIG+=without_network ..
    make
}

package() {
    install -Dm755 "cubiomes-viewer/build/cubiomes-viewer" "${pkgdir}/usr/bin/cubiomes-viewer"
    install -Dm644 "cubiomes-viewer/etc/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.cubitect.cubiomes-viewer.svg"
    install -Dm644 "cubiomes-viewer/etc/com.github.cubitect.cubiomes-viewer.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "cubiomes-viewer/etc/com.github.cubitect.cubiomes-viewer.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "cubiomes-viewer/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
