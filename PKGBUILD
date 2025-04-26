# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-substance
pkgver=3.0.4
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.adobe.com/products/substance3d/plugins/substance-in-maya.html'
license=('custom')
depends=('maya>=2026' 'maya<2027')
optdepends=('maya-arnold: Arnold renderer support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://AdobeSubstance3DforMaya-${pkgver}-${_mayaver}-linux-x86_64.rpm")
b2sums=('486e675d0f2db59424186ab793cc6beb1936fd59edd59e089a6560a96c5a01398bef6e264656c2c83c687e231c7f06f033334166c027843975a3287ac95fc8fe')

options=(!strip)

prepare() {
    echo "+ PLATFORM:linux substance3 $pkgver /usr/autodesk/maya$_mayaver/plug-ins/substance3" > opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance3.mod
    echo 'PATH+:=lib' >> opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance3.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,plug-ins/substance3}
    mv opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance3.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv opt/Allegorithmic/Substance_in_Maya/$_mayaver/* "$pkgdir/usr/autodesk/maya$_mayaver/plug-ins/substance3/"
}
