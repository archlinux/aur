# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2027

pkgname=maya-substance
pkgver=3.0.6
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.adobe.com/products/substance3d/plugins/substance-in-maya.html'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2028')
optdepends=('maya-arnold: Arnold renderer support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://AdobeSubstance3DforMaya-${pkgver}-${_mayaver}-linux-x86_64.rpm")
b2sums=('6d825a553b25f85ac94d9f409cad53b0cd2639a0819dd515362587b703fad4a3d8fc0a18cb8d12c6c7e2ea14275c5556d04bdc9d0ed54045a96db286cf2094e8')

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
