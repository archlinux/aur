# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Barfin
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Jekyll Wu, Jacco Koning, qwak, twa022

pkgname=usb-creator
pkgver=0.3.15
pkgrel=1
pkgdesc="Create bootable USB from a LiveCD or disc image of Ubuntu"
arch=('any')
url="https://git.launchpad.net/~usb-creator-hackers/usb-creator/+git/main"
license=('GPL3')
depends=('cdrkit'
         'dosfstools'
         'gtk3'
         'kde-dev-scripts'
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
b2sums=('f028fba9b57413ef01573deec88e89d1756a5f4f4434b27fcf63a03d87f6b454cc332514d2001c71acb2ed49a7c08cea0b87c7170cfbd88c6acefa2816d15ef1')

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
