# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=maya-arnold
pkgver=5.5.0
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=('maya>=2026' 'maya<2027')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=("manual://package.zip")
b2sums=('705cc97833e795d8b03e9a0e7b31bb8a5736ecd8d5ccbc1ea9522ed4f3fbe1507d2bcba4775da029add091f5acbe77241e1dbd81b9e5c06cbf3564f0055d2205')

options=(!strip)

prepare() {
    sed -i 's|any .|any /usr/autodesk/maya2026/plug-ins/arnold|g' mtoa.mod
}

package() {
    unlink package.zip
    mkdir -p "$pkgdir/usr/autodesk/maya2026/"{modules,plug-ins/arnold}

    mv mtoa.mod "$pkgdir/usr/autodesk/maya2026/modules/"
    mv * "$pkgdir/usr/autodesk/maya2026/plug-ins/arnold/"
}
