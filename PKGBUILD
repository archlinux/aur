# Maintainer: Jakub Szymański <jakubmateusz@poczta.onet.pl>
pkgname=woeusb-ng
pkgver=0.2.8
pkgrel=1
pkgdesc="Simple tool that enable you to create your own usb stick with Windows installer."
arch=('any')
url="https://github.com/WoeUSB/WoeUSB-ng"
license=('GPL3')
depends=(
    'parted'
    'dosfstools'
    'ntfs-3g'
    'grub'
    'p7zip'
    'python'
    'python-pip'
    'python-wxpython'
    'xdg-utils'
    'python-termcolor'
    )
makedepends=(
    'python-setuptools'
)
provides=('woeusb')
conflicts=(
    'woeusb'
    'woeusb-git'
)
source=(
    "https://github.com/WoeUSB/WoeUSB-ng/archive/v$pkgver.tar.gz"
)
sha256sums=(
    "8a7e0bd6ced96a02d7a3ad829073809a67d20e6099104ce0a9f5234699a07666"
)


build() {
    cd WoeUSB-ng-$pkgver

    python setup.py build
}

package() {
    cd WoeUSB-ng-$pkgver

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/icons/WoeUSB-ng
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/polkit-1/actions

    # scripts
    cp WoeUSB/woeusb WoeUSB/woeusbgui $pkgdir/usr/bin

    # icon
    cp WoeUSB/data/icon.ico $pkgdir/usr/share/icons/WoeUSB-ng/icon.ico

    # shortcut
    cp miscellaneous/WoeUSB-ng.desktop $pkgdir/usr/share/applications/WoeUSB-ng.desktop
    chmod 755 $pkgdir/usr/share/applications/WoeUSB-ng.desktop

    # policy
    cp miscellaneous/com.github.woeusb.woeusb-ng.policy $pkgdir/usr/share/polkit-1/actions/com.github.woeusb.woeusb-ng.policy
}
