# Maintainer: William Tang <galaxyking0419@gmail.com>

_mayaver=2023

pkgname=maya-substance
pkgver=2.3.1
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.substance3d.com/ecosystem-plug-ins/substance-in-maya'
license=('custom')
depends=('maya>=2023.0' 'maya<2024.0')
optdepends=('maya-arnold: Arnold renderer support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://AdobeSubstance3DforMaya-$pkgver-$_mayaver-Linux.rpm")
sha256sums=('67d805279ba852a86bca9041be4506f46987143c551f22920ab522e997107443')

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
