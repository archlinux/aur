# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=gns3-gui
pkgname="$_pkgname"-git
pkgver=v2.1.9.r25.g3000a9aa
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=('any')
url='https://github.com/GNS3/gns3-gui'
license=('GPL3')
groups=('gns3')
provides=('gns3-gui')
conflicts=('gns3-gui')
makedepends=('git' 'python-setuptools')
depends=('python-jsonschema' 'gns3-converter' 'python-raven' 'python-psutil'
         'python-pyqt5' 'python-sip' 'qt5-svg' 'qt5-websockets' 'desktop-file-utils')
optdepends=('gns3-server-git: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM.'
            'dynamips: Cisco router emulator.'
            'xterm: Default terminal emulator for CLI management of virtual instances.'
            'wireshark-gtk: Live packet capture.')
source=("$_pkgname::git+git://github.com/GNS3/$_pkgname.git#branch=2.1"
        'gns3.desktop')
sha256sums=('SKIP'
            '51e6db5b47e6af3d008d85e8c597755369fafb75ddb2af9e79a441f943f4c166')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "$srcdir"/gns3.desktop "$pkgdir"/usr/share/applications/gns3.desktop
    install -Dm644 resources/images/gns3_icon_256x256.png "$pkgdir"/usr/share/pixmaps/gns3.png
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
