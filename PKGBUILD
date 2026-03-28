# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2027

pkgname=maya-substance
pkgver=3.0.5
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.adobe.com/products/substance3d/plugins/substance-in-maya.html'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2028')
optdepends=('maya-arnold: Arnold renderer support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://AdobeSubstance3DforMaya-${pkgver}-${_mayaver}-linux-x86_64.rpm")
b2sums=('421855cd03f2ebe023a1a2309b79176b50d7748d822957681bd52fa0c79f35c54cdc01293910a3e404f86f5a22cab879fb59799c21db25734f8e26c59d63f9f5')

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
