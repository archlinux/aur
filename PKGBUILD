# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=maya-arnold
pkgver=5.3.1
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://www.arnoldrenderer.com/arnold/arnold-for-maya/'
license=('custom')
depends=('maya>=2024' 'maya<2025')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://package.zip')
sha256sums=('dcfea3cd0d32bd8293b5f287339fec9bfcb9e715348d698e8e112c3c08b29e21')

options=(!strip)

prepare() {
    sed -i 's|any .|any /usr/autodesk/maya2024/plug-ins/arnold|g' mtoa.mod
}

package() {
    unlink package.zip
    mkdir -p $pkgdir/usr/autodesk/maya2024/{modules,plug-ins/arnold}

    mv mtoa.mod $pkgdir/usr/autodesk/maya2024/modules/
    mv * $pkgdir/usr/autodesk/maya2024/plug-ins/arnold/
}
