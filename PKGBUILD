# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-arnold
pkgver=5.1.0
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://www.arnoldrenderer.com/arnold/arnold-for-maya/'
license=('custom')
depends=('maya>=2023.0' 'maya<2024.0' 'smbclient' 'tbb')
optdepends=('maya-usd: Universal Scene Discription Support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://package.zip')
sha256sums=('4e2ed84e6c10eed69f7b079f62077d15010641224d28154ae30c844526306bb8')

options=(!strip)

prepare() {
    sed -i 's|/home/go-agent/pipelines/MtoA-5.1.0/material/mtoa/MTOA_DEPLOY|/usr/autodesk/maya2023/plug-ins/arnold|g' mtoa.mod
}

package() {
    unlink package.zip
    mkdir -p $pkgdir/usr/autodesk/maya2023/{modules,plug-ins/arnold}

    mv mtoa.mod $pkgdir/usr/autodesk/maya2023/modules/
    mv * $pkgdir/usr/autodesk/maya2023/plug-ins/arnold/
}
