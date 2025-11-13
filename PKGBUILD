# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-arnold
pkgver=5.5.4.2
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
b2sums=('09db5122d27464534e53baebcbcbb7e29f85046421c6038d11bec7eb2ac00ab13267e737aff46f389ecd6fd2f4b5efbe8b4dcfd492adf82d504e780d9c3a0d12')

options=(!strip)

prepare() {
    sed -i "s|any .|any /usr/autodesk/maya${_mayaver}/plug-ins/arnold|g" mtoa.mod
}

package() {
    unlink package.zip
    mkdir -p "$pkgdir/usr/autodesk/maya${_mayaver}/"{modules,plug-ins/arnold}

    mv mtoa.mod "$pkgdir/usr/autodesk/maya${_mayaver}/modules/"
    mv * "$pkgdir/usr/autodesk/maya${_mayaver}/plug-ins/arnold/"
}
