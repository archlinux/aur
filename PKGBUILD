# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Barfin
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Jekyll Wu, Jacco Koning, qwak, twa022, tee

pkgname=usb-creator
pkgver=0.3.17
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
b2sums=('76875740e6797955397533ae190da8743d8357a22cb3c10e5872792dd9e42cc41f29b39d213acc26eb4f282ac80a99570d881cdae39d038ed0f6aaae51f50c32')

prepare() {
    cd main
    sed -i 's/except ImportError/except (ImportError, ValueError)/g' usbcreator/frontends/gtk/unitysupport.py
}

build() {
    cd main
    python setup.py build
}

package() {
    cd main

    python3 setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 -t "$pkgdir"/usr/share/man/man8 man/$pkgname-{gtk,kde}.8
}
