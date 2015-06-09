# Maintainer: Peter Petrov <onestone at gmail dot com>
pkgname=omnikey_ifdokccid
pkgver=4.0.5.5
pkgrel=1
pkgdesc="CCID driver for HID Global OMNIKEY CardMan Smartcard reader series"
arch=('i686' 'x86_64')
url="http://www.hidglobal.com/"
license=('unknown')
depends=('libusb' 'pcsclite')
source_i686=("http://www.hidglobal.com/sites/hidglobal.com/files/drivers/ifdokccid_linux_i686-v${pkgver}.tar.gz")
source_x86_64=("http://www.hidglobal.com/sites/hidglobal.com/files/drivers/ifdokccid_linux_x86_64-v${pkgver}.tar.gz")
md5sums_i686=('ad33d16f2e5549b66428af3edbf8d6c6')
md5sums_x86_64=('854a533626493deb9e6bee43cee2daaf')

package() {
    cd $srcdir/ifdokccid_linux_${CARCH}-v${pkgver}
    mkdir -p $pkgdir/usr/lib/pcsc/drivers
    cp -r ifdokccid_linux_${CARCH}-v${pkgver}.bundle $pkgdir/usr/lib/pcsc/drivers
    mkdir -p $pkgdir/etc
    install -m0600 omnikey.ini $pkgdir/etc/omnikey.ini
    mkdir -p $pkgdir/etc/udev/rules.d
    install -m0644 z98_omnikey.rules $pkgdir/etc/udev/rules.d/z98_omnikey.rules
    mkdir -p $pkgdir/usr/lib/udev
    install -m0744 ok_pcscd_hotplug.sh $pkgdir/usr/lib/udev/ok_pcscd_hotplug.sh
}
