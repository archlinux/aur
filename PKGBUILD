# Maintainer: William Tang <galaxyking0419@gmail.com>

_mayaver=2023

pkgname=maya-usd
pkgver=0.19.0
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Discription Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('custom')
depends=('maya>=2023.0' 'maya<2024.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://MayaUSD$_mayaver-202208051814-6d974fb-$pkgver-1.x86_64.rpm")
sha256sums=('152e14d9fdc1a573915f494308ee837c14fb6efa74a476c2496d990fac9a4ef2')

options=(!strip)

prepare() {
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/mayausd|g" usr/autodesk/modules/maya/$_mayaver/mayausd.mod
    sed -i 's/\$MAYA_PYTHON_VERSION/3/g' usr/autodesk/modules/maya/$_mayaver/mayausd.mod
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins/mayausd}
    mv usr/autodesk/modules/maya/$_mayaver/mayausd.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv usr/autodesk/mayausd/maya$_mayaver/${pkgver}_202208051814-6d974fb/mayausd/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/mayausd/
}
