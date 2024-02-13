# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=maya-arnold
pkgver=5.3.5.1
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=('maya>=2024' 'maya<2025')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=('manual://MtoA-5.3.5.1-linux-2024.run')
b2sums=('63d0ab1b1faca10ed872054942ead3820e9f412cb40e3e0751c4fa3efb9458ce4548a26fc252fe6758e7a28597b8c2e1a685ddc02b91c859079233303db04557')

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
