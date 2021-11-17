# apple-superdrive-udev
# Maintainer: Sterophonick

pkgname=apple-superdrive-udev
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="udev rule that allows the Apple USB SuperDrive to function"
depends=('sg3_utils')

build() {
     echo "# Apple's USB SuperDrive" > 60-apple-superdrive.rules
     echo 'ACTION=="add", ATTRS{idProduct}=="1500", ATTRS{idVendor}=="05ac", DRIVERS=="usb", RUN+="/usr/bin/sg_raw /dev/$kernel EA 00 00 00 00 00 01"' >> 60-apple-superdrive.rules
}

package() {
	mkdir "${pkgdir}/etc"
    mkdir "${pkgdir}/etc/udev"
    mkdir "${pkgdir}/etc/udev/rules.d"
    cp ./60-apple-superdrive.rules "${pkgdir}/etc/udev/rules.d"
}

