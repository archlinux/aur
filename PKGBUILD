# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2024

pkgname=maya-substance
pkgver=2.3.2
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.substance3d.com/ecosystem-plug-ins/substance-in-maya'
license=('custom')
depends=('maya>=2024.0' 'maya<2025.0')
optdepends=('maya-arnold: Arnold renderer support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://AdobeSubstance3DforMaya-$pkgver-$_mayaver-linux-x86_64.rpm")
sha256sums=('7e68facba066f8980c39e2ada4169ffd7b6bfa6fb899a986835ff0afd7ea1ef0')

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
