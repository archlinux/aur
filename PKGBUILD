# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad
pkgver=24.1.06
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
sha256sums=('57f26cf242a719cec1fa12b558d92c7d27c64f14f43d7a1bd334d3aeb5edfcdb')

options=(!strip)
install='bricscad.install'

prepare() {
    tar -xpf data.tar.xz

    find . -type d -exec chmod 755 {} \;

    mkdir var/bricsys/{Components,RenderMaterials/UserMaterials}
    chmod -R 777 var/bricsys/
}

package() {
    mv opt usr var $pkgdir/
}
