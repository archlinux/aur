# Maintainer: c4tz

pkgname=('luxafor-python')
pkgver=0.0.1
pkgrel=1
pkgdesc="Script written to modify the Luxafor USB LED indicator via command line using python."
arch=('any')
url="https://github.com/vmitchell85/luxafor-python"
license=('CC0-1.0')
depends=(
    'python2'
    'python2-pyusb'
)
makedepends=('git')
source=("git+https://github.com/vmitchell85/${pkgname}.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"

    echo '# Allow Luxafor USB control' >> udev_file 
    echo 'ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="f372", MODE="660", GROUP="users"' >> udev_file
    install -D -m644 udev_file ${pkgdir}/usr/lib/udev/rules.d/50-luxafor.rules
    
    sed -i "s;#!/usr/bin/env python;#!/usr/bin/env python2;g" luxafor-linux.py
    install -D -m755 luxafor-linux.py ${pkgdir}/usr/bin/luxafor
}
