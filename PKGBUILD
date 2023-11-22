# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2024

pkgname=maya-substance
pkgver=2.4.0
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.substance3d.com/ecosystem-plug-ins/substance-in-maya'
license=('custom')
depends=('maya>=2024.0' 'maya<2025.0')
optdepends=('maya-arnold: Arnold renderer support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://AdobeSubstance3DforMaya-$pkgver-$_mayaver-linux-x86_64.rpm")
b2sums=('2ff6f8abe04ca4efbda7d989566a2264803c01e63a01dde91bdbcc46076f06244ee37489183795982b1f88c72e69250b07ce4a32edd4c60ee019f4ac99837854')

options=(!strip)

prepare() {
    echo "+ PLATFORM:linux substance2 $pkgver /usr/autodesk/maya$_mayaver/plug-ins/substance2" > opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance2.mod
    echo 'PATH+:=lib' >> opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance2.mod
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins/substance2}
    mv opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance2.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv opt/Allegorithmic/Substance_in_Maya/$_mayaver/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/substance2/
}
