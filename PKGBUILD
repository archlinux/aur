# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=maya-arnold
pkgver=5.3.4.1
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=('maya>=2024' 'maya<2025')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=('manual://package.zip')
b2sums=('1be0581937469b8e7e1d1a84e28877f62aa5f19c2bd10e460d01655858c0108574d408c9dfca564f829c72225e83ea2c294f08c979e47a654938cf2bdba4e34e')

options=(!strip)

prepare() {
    sed -i 's|any .|any /usr/autodesk/maya2024/plug-ins/arnold|g' mtoa.mod
}

package() {
    unlink package.zip
    mkdir -p "$pkgdir/usr/autodesk/maya2024/"{modules,plug-ins/arnold}

    mv mtoa.mod "$pkgdir/usr/autodesk/maya2024/modules/"
    mv * "$pkgdir/usr/autodesk/maya2024/plug-ins/arnold/"
}
