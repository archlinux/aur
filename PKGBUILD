# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Barfin
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Jekyll Wu, Jacco Koning, qwak, twa022

pkgname=usb-creator
pkgver=0.3.16
pkgrel=1
pkgdesc="Create bootable USB from a LiveCD or disc image of Ubuntu"
arch=('any')
url="https://git.launchpad.net/~usb-creator-hackers/usb-creator/+git/main"
license=('GPL3')
depends=('cdrkit'
         'dosfstools'
         'gtk3'
         'kde-dev-scripts'
         'libisoburn'
         'mtools'
         'parted'
         'python'
         'python-dbus'
         'python-gobject'
         'python-pyqt5'
         'syslinux'
         'udisks2')
makedepends=('python-distutils-extra'
             'python-setuptools')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.xz")
b2sums=('96917cd9c3aa12f876b6120214a46d468f35955fea8d66614eb2dcba0063164a6ff68be3c658511016f51900b9d5aed987b44aa5590af7922344371ba1b6d25c')

prepare() {
    cd trunk
    sed -i 's/except ImportError/except (ImportError, ValueError)/g' usbcreator/frontends/gtk/unitysupport.py
}

build() {
    cd trunk
    python setup.py build
}

package() {
    cd trunk

    python3 setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 -t "$pkgdir"/usr/share/man/man8 man/$pkgname-{gtk,kde}.8
}
