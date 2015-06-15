# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=omnikey_cardman_5x2x
pkgver=4.1.5
pkgrel=2
pkgdesc="Driver for OMNIKEY Cardman 3x21, 5x2x, 6x2x, Smart@Key, Smart@Link"
arch=('i686' 'x86_64')
url="http://www.hidglobal.com"
# eglibc-2.11.3
depends=('libusb>=1.0.8' 'pcsclite>1.5.5')
source_x86_64=(http://www.hidglobal.com/sites/hidglobal.com/files/drivers/ifdokccid_linux_x86_64-v${pkgver}.tar.gz)
source_i686=(http://www.hidglobal.com/sites/hidglobal.com/files/drivers/ifdokccid_linux_i686-v${pkgver}.tar.gz)
md5sums_i686=('6dc30b82972cae89e8217a065c721152')
md5sums_x86_64=('1ba7d54cfa38a659db6e369b3c5f87dd')
license=('unknown')

package() {
  cd $srcdir/ifdokccid_linux_${CARCH}-v${pkgver}

  mkdir -p $pkgdir/usr/lib/pcsc/drivers
  cp -r ifdokccid_linux_${CARCH}-v${pkgver}.bundle $pkgdir/usr/lib/pcsc/drivers

  install -D -m664 omnikey.ini $pkgdir/etc/omnikey.ini
  install -D -m664 z98_omnikey.rules $pkgdir/etc/udev/rules.d/z98_omnikey.rules
  install -D -m664 ok_pcscd_hotplug.sh $pkgdir/usr/lib/udev/ok_pcscd_hotplug.sh
}
