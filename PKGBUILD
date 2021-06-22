# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-arnold
pkgver=4.2.1
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://www.arnoldrenderer.com/arnold/arnold-for-maya/'
license=('custom')
depends=('maya>=2022.0' 'maya<2023.0' 'smbclient' 'tbb')
optdepends=('maya-usd: Universal Scene Discription Support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://package.zip')
sha256sums=('f5802a922d5960f2465963f9221e4377ea2daa70482db89076defa68ea478a39')

options=(!strip)

prepare() {
    sed -i 's|/jenkins/workspace/Arnold-MTOA_Build_LINUX_CENTOS73/MTOA_DEPLOY|/usr/autodesk/maya2022/plug-ins/arnold|g' mtoa.mod
}

package() {
    unlink package.zip
    mkdir -p $pkgdir/usr/autodesk/maya2022/{modules,plug-ins/arnold}

    mv mtoa.mod $pkgdir/usr/autodesk/maya2022/modules/
    mv * $pkgdir/usr/autodesk/maya2022/plug-ins/arnold/
}
