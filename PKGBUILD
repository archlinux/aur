# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad
pkgver=24.2.07
pkgrel=1
pkgdesc="CAD Software for People Who Build the Future"
arch=('x86_64')
url='https://www.bricsys.com/'
license=('custom')

conflicts=('bricscad-cn')
depends=('alsa-lib' 'glu' 'libxcrypt-compat' 'libxkbfile' 'nss' 'openmotif' 'webkit2gtk' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm')
optdepends=('bricscad-communicator>=24: Addtional import/export file format support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-V${pkgver}-1-en_US-amd64.deb")
sha256sums=('bff5d2d282003611425e3ae7b7fd5aa6ce91fdb6759d00b6660f1d9979849085')

options=(!strip)
install='bricscad.install'

prepare() {
    tar -xpf data.tar.zst

    find . -type d -exec chmod 755 {} +

    mkdir var/bricsys/{Components,RenderMaterials/UserMaterials}
    chmod -R 777 var/bricsys/
}

package() {
    mv opt usr var $pkgdir/
}
