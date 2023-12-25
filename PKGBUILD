# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2024

pkgname=maya-substance
pkgver=2.4.1
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://substance3d.adobe.com/plugins/substance-in-maya/'
license=('custom')
depends=('maya>=2024.0' 'maya<2025.0')
optdepends=('maya-arnold: Arnold renderer support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("https://download.substance3d.com/adobe-substance-3d-for-maya/2.x/Adobe_Substance_3D_for_Maya-$pkgver%2B$_mayaver-102-x86_64-linux.rpm")
b2sums=('0ee5eb0fdaac6b8b37b8ef9589bdd74496fe3acd76d412aba258068b202940833ce7150f69b2e331935ac6576f0c0005c30f61974af23899c8783149b055650c')

options=(!strip)

prepare() {
    echo "+ PLATFORM:linux substance2 $pkgver /usr/autodesk/maya$_mayaver/plug-ins/substance2" > opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance2.mod
    echo 'PATH+:=lib' >> opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance2.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,plug-ins/substance2}
    mv opt/Allegorithmic/Substance_in_Maya/$_mayaver/substance2.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv opt/Allegorithmic/Substance_in_Maya/$_mayaver/* "$pkgdir/usr/autodesk/maya$_mayaver/plug-ins/substance2/"
}
