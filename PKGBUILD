# Maintainer: William Tang <galaxyking0419@gmail.com>

_mayaver=2023

pkgname=maya-bifrost
pkgver=2.5.1.0
pkgrel=1
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=('maya>=2023' 'maya<2024.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost$_mayaver-$pkgver-$pkgver-1.x86_64.rpm")
sha256sums=('0f50176d10157b09a0e4e2fe48fc3cf82571f7e5b8824b278c1eeccfc7d1abbe')

options=(!strip)

prepare() {
    sed -i "s|<BIFROST_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/bifrost|g" usr/autodesk/modules/maya/$_mayaver/bifrost.mod
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/vnn|g" usr/autodesk/modules/maya/$_mayaver/vnn.mod
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins}
    mv usr/autodesk/modules/maya/$_mayaver/*.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv usr/autodesk/bifrost/maya$_mayaver/$pkgver/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/
}
