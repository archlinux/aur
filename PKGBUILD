# Maintainer: William Tang <galaxyking0419@gmail.com>

_mayaver=2023

pkgname=maya-substance
pkgver=2.2.2
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.substance3d.com/ecosystem-plug-ins/substance-in-maya'
license=('custom')
depends=('maya>=2023.0' 'maya<2024.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://AdobeSubstance3DforMaya-$pkgver-$_mayaver.Linux.rpm")
sha256sums=('b7d9757312328e932f015210f3e904faa9f7daefb92f189043b1a64f08ad0e89')

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
