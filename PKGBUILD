# Maintainer: Arimil <renari at arimil dot com>
pkgname=ffxrt
pkgver=1.4
pkgrel=1
pkgdesc='Final Fantasy X Relationship Tracker'
arch=('x86_64')
url='https://github.com/Renari/FFXRT'
license=('LGPL-3.0-or-later')
depends=('qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Renari/FFXRT/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('217f822fa41564697659220b7455a0c244d213512eaf6fa6e1a75c04c07c6555')

build() {
    cd "FFXRT-${pkgver}/FFXRT"
    qmake-qt5 FFXRT.pro CONFIG+=release
    make -j$(nproc)
}

package() {
    cd "FFXRT-${pkgver}"
    install -Dm755 FFXRT/FFXRT "${pkgdir}/usr/bin/FFXRT"
    install -Dm644 ffxrt.desktop "${pkgdir}/usr/share/applications/ffxrt.desktop"
    install -Dm644 FFXRT/ffxrt.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ffxrt.png"
    install -Dm644 FFXRT/ffxrt.png "${pkgdir}/usr/share/pixmaps/ffxrt.png"
    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
