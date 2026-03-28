# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2027

pkgname=maya-arnold
pkgver=5.6.0
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2028')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=("manual://package.tgz")
b2sums=('183a439f157f3ba5ea1b8565d38a26f60721f764bbaebfa5820c9d33c2180dbb80f935bfc77205e89b1ad9b974863bdf7f2f4032a2e77da8ac26bf2e2705e1ac')

options=(!strip)

prepare() {
    sed -i "s|any .|any /usr/autodesk/maya${_mayaver}/plug-ins/arnold|g" mtoa.mod
}

package() {
    unlink package.tgz
    mkdir -p "$pkgdir/usr/autodesk/maya${_mayaver}/"{modules,plug-ins/arnold}

    mv mtoa.mod "$pkgdir/usr/autodesk/maya${_mayaver}/modules/"
    mv * "$pkgdir/usr/autodesk/maya${_mayaver}/plug-ins/arnold/"
}
