# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2024

pkgname=maya-usd
pkgver=0.23.1
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Discription Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('custom')
depends=('maya>=2024.0' 'maya<2025.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://MayaUSD$_mayaver-202304181210-131a6c1-$pkgver-1.x86_64.rpm")
sha256sums=('0e7445f18e25b58da2f55a1b4b8870f105025598156743b88dba565104cccd60')

options=(!strip)

prepare() {
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/mayausd|g" usr/autodesk/modules/maya/$_mayaver/mayausd.mod
    sed -i 's/\$MAYA_PYTHON_VERSION/3/g' usr/autodesk/modules/maya/$_mayaver/mayausd.mod
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins/mayausd}
    mv usr/autodesk/modules/maya/$_mayaver/mayausd.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv usr/autodesk/mayausd/maya$_mayaver/${pkgver}_202304181210-131a6c1/mayausd/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/mayausd/
}
