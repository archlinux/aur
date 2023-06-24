# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad
pkgver=23.2.06
pkgrel=1
pkgdesc="CAD Software for People Who Build the Future"
arch=('x86_64')
url='https://www.bricsys.com/'
license=('custom')

conflicts=('bricscad-cn')
depends=('alsa-lib' 'glu' 'libxcrypt-compat' 'nss' 'openmotif' 'qt5-3d' 'qt5-wayland' 'webkit2gtk')
optdepends=('bricscad-communicator>=22: Addtional import/export file format support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-V${pkgver}-1-en_US-amd64.deb")
sha256sums=('8652986c957280cf14b107908422e23575195df7eaf7ebf363d48be4059a4b05')

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
