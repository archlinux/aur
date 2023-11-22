# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2024

pkgname=maya-usd-bin
pkgver=0.25.0
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Discription Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('Apache')
depends=('maya>=2024.0' 'maya<2025.0')
provides=('maya-usd')
conflicts=('maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://MayaUSD$_mayaver-202310160731-bbc8cc8-$pkgver-1.x86_64.rpm")
b2sums=('5944f9032c41a93be446c893b9b558c4b02fc0fac6e8684fcf724362ce782bbe5b26683295f10a97dac35ee8285e67ac1316468a7b06e6326976df57738d51ba')

options=(!strip)

prepare() {
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/mayausd|g" usr/autodesk/modules/maya/$_mayaver/mayausd.mod
    sed -i 's/\$MAYA_PYTHON_VERSION/3/g' usr/autodesk/modules/maya/$_mayaver/mayausd.mod
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins/mayausd}
    mv usr/autodesk/modules/maya/$_mayaver/mayausd.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv usr/autodesk/mayausd/maya$_mayaver/${pkgver}_202310160731-bbc8cc8/mayausd/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/mayausd/
}
