# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-arnold
pkgver=5.5.2
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2027')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=("manual://package.zip")
b2sums=('e92d057533aa8e2ae07fe5f471e0bad512d645d534a787afbef5f9c503a16e279aeadaa0b91cdf163ca2c925e34a04c81dd46fb3206681a70dc85e0927a77cea')

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
