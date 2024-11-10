# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=cubiomes-viewer
pkgver=4.1.2
pkgrel=1
pkgdesc="An efficient graphical Minecraft seed finder and map viewer"
arch=("x86_64")
url="https://github.com/Cubitect/cubiomes-viewer"
license=('GPL3')
depends=("qt5-base")
makedepends=("qt5-tools")
source=("https://github.com/Cubitect/cubiomes-viewer/releases/download/${pkgver}/cubiomes-viewer-${pkgver}-src.tar.gz")
sha256sums=("fa8aa328b4bfbdd5df9474cc9bd13a121d4c93f5f45f2fd40a79a53d9ab42255")

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
