# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad
pkgver=22.2.05
pkgrel=1
pkgdesc="CAD Software for People Who Build the Future"
arch=('x86_64')
url='https://www.bricsys.com/'
license=('custom')

conflicts=('bricscad-cn')
depends=('qt5-gamepad' 'qt5-3d' 'qt5-wayland' 'qt5-serialport' 'openmotif' 'webkit2gtk' 'libxcrypt-compat' 'nss' 'glu' 'libffi6' 'alsa-lib')
optdepends=('bricscad-communicator>=22: Addtional import/export file format support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-V${pkgver}-1-en_US-amd64.deb")
sha256sums=('018dd04a132fcc5db33a37519680e6bb7b577f0e66949a9666034b804951ae32')

options=(!strip)
install='bricscad.install'

prepare() {
    tar -xpf data.tar.xz

    find . -type d -exec chmod 755 {} \;

    mkdir var/bricsys/{Components,RenderMaterials/UserMaterials}
    chmod 777 var/bricsys/{Components,RenderMaterials/UserMaterials}
}

package() {
    mv opt usr var $pkgdir/
}
