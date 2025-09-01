# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad
pkgver=25.2.07
pkgrel=1
pkgdesc="CAD Software for People Who Build the Future"
arch=('x86_64')
url='https://www.bricsys.com/'
license=('custom')

conflicts=('bricscad-cn')
depends=('alsa-lib' 'glu' 'libdeflate' 'libxcrypt-compat' 'libxkbfile' 'libxml2-legacy' 'nss' 'openmotif' 'webkit2gtk' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm')
optdepends=('bricscad-communicator>=25: Addtional import/export file format support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-V${pkgver}-1-en_US-amd64.deb")
sha256sums=('2ebb39b05bc3779fac805e5af8bfa0f34eb35f954aeca42d7f92e6989af42d29')

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
