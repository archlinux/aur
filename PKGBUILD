# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-arnold
pkgver=5.2.0
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://www.arnoldrenderer.com/arnold/arnold-for-maya/'
license=('custom')
depends=('maya>=2023' 'maya<2024')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://package.zip')
sha256sums=('41d9f6ec9dea28db2df52f909530f018546dc179135f2d4ff65d75e6a540b874')

options=(!strip)

prepare() {
    sed -i 's|/home/go-agent/pipelines/MtoA-MayaCrative/material/mtoa/MTOA_DEPLOY|/usr/autodesk/maya2023/plug-ins/arnold|g' mtoa.mod
}

package() {
    unlink package.zip
    mkdir -p $pkgdir/usr/autodesk/maya2023/{modules,plug-ins/arnold}

    mv mtoa.mod $pkgdir/usr/autodesk/maya2023/modules/
    mv * $pkgdir/usr/autodesk/maya2023/plug-ins/arnold/
}
