# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=chessmd
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight chess PGN database viewer and analysis tool."
arch=('x86_64')
url="https://chessmd.org/"
#url="https://github.com/ChessMD/ChessMD"
license=('AGPL-3.0-only')
depends=('qt6-charts' 'qt6-svg')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ChessMD/ChessMD/archive/refs/tags/v${pkgver}.tar.gz"
        "ChessMD.desktop")
sha256sums=('ad95cfba4152ce7ab0c700b9c00a3b07d997c59558237e676f54a51a92d1265d'
            'cd247a7aaf776e0129127a3bd712ac33cde16d9453d7ac4ab311b2ce3016d4d2')

build() {
    cd ChessMD-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_DIR=/usr/lib/cmake/Qt6 .
    make
}

package() {
    cd ChessMD-${pkgver}

    # Binary
    install -Dm755 ChessMD $pkgdir/usr/bin/ChessMD

    # Desktop file
    install -Dm644 "${srcdir}/ChessMD.desktop" "${pkgdir}/usr/share/applications/ChessMD.desktop"
    install -Dm644 "img/logo.png" "${pkgdir}/usr/share/pixmaps/ChessMD.png"
}
