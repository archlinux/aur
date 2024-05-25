# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=maya-arnold
pkgver=5.4.2
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=('maya>=2024' 'maya<2025')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=("manual://MtoA-${pkgver}-linux-2024.run")
b2sums=('3d440679e56c701c03cc16c5c4b2f73dc2bea4e82661cce46fd0fc9f56aed91b8c0c7ea6fe48ef8a856c5306612a88778c4caad8367ffe50180f107655aa7237')

options=(!strip)

prepare() {
    chmod +x ./MtoA-${pkgver}-linux-2024.run
    ./MtoA-${pkgver}-linux-2024.run --tar xvf
    mkdir extracted
    echo 'Extracting zip...'
    bsdtar -xf *.zip --directory extracted
    sed -i 's|any .|any /usr/autodesk/maya2024/plug-ins/arnold|g' extracted/mtoa.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya2024/"{modules,plug-ins/arnold}

    mv extracted/mtoa.mod "$pkgdir/usr/autodesk/maya2024/modules/"
    mv extracted/* "$pkgdir/usr/autodesk/maya2024/plug-ins/arnold/"
}
