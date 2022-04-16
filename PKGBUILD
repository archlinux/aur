# Maintainer: William Tang <galaxyking0419@gmail.com>

_mayaver=2023

pkgname=maya-usd
pkgver=0.16.0
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Discription Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('custom')
depends=('maya>=2023.0' 'maya<2024.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://MayaUSD$_mayaver-202202052333-1c49ce6-$pkgver-1.x86_64.rpm")
sha256sums=('7a702c26d48bfa2e1962af643c6b8108acf200c6ff3cbe9904b0d15abfe78e47')

options=(!strip)

prepare() {
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/mayausd|g" usr/autodesk/modules/maya/$_mayaver/mayausd.mod
    sed -i 's/\$MAYA_PYTHON_VERSION/3/g' usr/autodesk/modules/maya/$_mayaver/mayausd.mod
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins/mayausd}

    mv usr/autodesk/modules/maya/$_mayaver/mayausd.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv usr/autodesk/mayausd/maya$_mayaver/0.16.0_202202052333-1c49ce6/mayausd/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/mayausd/
}
