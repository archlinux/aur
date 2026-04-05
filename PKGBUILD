# Maintainer: William Tang <ttc0419@outlook.com>

pkgname=bricscad
pkgver=26.2.03
pkgrel=1
pkgdesc="CAD Software for People Who Build the Future"
arch=('x86_64')
url='https://www.bricsys.com/'
license=('custom')

conflicts=('bricscad-cn')
depends=('alsa-lib' 'glu' 'gtk3' 'libsecret' 'libsm' 'libxcrypt-compat' 'libxkbcommon-x11' 'libxkbfile' 'libxml2-legacy' 'nss' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm')
optdepends=('bricscad-communicator>=26: Addtional import/export file format support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-V${pkgver}-1-en_US-amd64.deb")
sha256sums=('6d8eb84f9ae1cc31313b036ac6c5e176acb455a6af9a4221f32143ec7e9a3c03')

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
