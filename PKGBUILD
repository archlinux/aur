# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=maya-arnold
pkgver=5.3.5.2
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=('maya>=2024' 'maya<2025')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=('manual://MtoA-5.3.5.2-linux-2024.run')
b2sums=('ed1183e088d8f1de5a56c8f9f823279fbeb511c76b51b0132c95991423c9660131e2943502626a6d976f9d7e7ceb789a5a65d4a5ab36a4118ebe914d08f172e8')

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
