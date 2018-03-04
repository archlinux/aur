# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
_gitrel=d2622a7fbea0
pkgname=omnikey_ifdokccid-git
pkgver=4.3.2
pkgrel=1
pkgdesc="PCSC driver for OMNIKEY 1021, 3x21, 6121,512x, 532x"
arch=('i686' 'x86_64')
url="http://www.hidglobal.com/"
license=('unknown')
depends=('libusb' 'pcsclite')
source=("https://www.hidglobal.com/sites/default/files/drivers/ifdokccid_linux_v.${pkgver}-${pkgrel}-${_gitrel}.tar.gz")
md5sums=('11b6bedbe2d7578c17ccfc7fd58f5059')

package() {
    # Extract the multi-package first
    cd $srcdir/ifdokccid_linux_v.${pkgver}-${pkgrel}-${_gitrel}

    # Temporary variable
    _PACKAGE_NAME="ifdokccid_linux_${CARCH}-v.${pkgver}-${pkgrel}-${_gitrel}"

    # Extract the platform package
    tar xzf ${_PACKAGE_NAME}.tar.gz
    cd ${_PACKAGE_NAME}

    # Start to build the driver package
    mkdir -p $pkgdir/usr/lib/pcsc/drivers
    cp -r ${_PACKAGE_NAME}.bundle $pkgdir/usr/lib/pcsc/drivers
    mkdir -p $pkgdir/etc
    install -m0600 omnikey.ini $pkgdir/etc/omnikey.ini
    mkdir -p $pkgdir/etc/udev/rules.d
    install -m0644 z98_omnikey.rules $pkgdir/etc/udev/rules.d/z98_omnikey.rules
    mkdir -p $pkgdir/usr/lib/udev
    install -m0744 ok_pcscd_hotplug.sh $pkgdir/usr/lib/udev/ok_pcscd_hotplug.sh
}
