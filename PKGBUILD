# Maintainer: syne <madlikene[at]aim.com>

pkgname=omnikey_cardman_x21
pkgver=3.9.0
pkgrel=2
pkgdesc="Driver for OMNIKEY Cardman 1021, 3021, 3121, 3621, 3821, 4321, 6121, Smart@Link, Smart@Key"
arch=('i686' 'x86_64')
  [ "$CARCH" = "i686" ]   && _arch=_i686
  [ "$CARCH" = "x86_64" ] && _arch=_x64
url="http://www.hidglobal.com"
depends=('libusb' 'pcsclite')
source=(https://www.hidglobal.com/sites/hidglobal.com/files/drivers/ifdokccid_lnx$_arch-$pkgver.tar.gz)
[ "$CARCH" = "i686" ] && sha256sums=('387f5780d58c7b019f5c8b10708896ebb94d0f64e2f07a0a740eab54b69f2c52')
[ "$CARCH" = "x86_64" ] && sha256sums=('ff40443fc746832d37893773c4f16622f857da1629d5ec83a862d2f999b180e1')
license=('custom')

package() {
  cd $srcdir/ifdokccid_lnx$_arch-$pkgver

  mkdir -p $pkgdir/usr/lib/pcsc/drivers
  cp -r ifdokccid_lnx$_arch-$pkgver.bundle $pkgdir/usr/lib/pcsc/drivers
  mkdir -p $pkgdir/etc/udev/rules.d
  cp z98_omnikey.rules $pkgdir/etc/udev/rules.d/10-omnikey.rules
  mkdir -p $pkgdir/usr/lib/udev
  cp ok_pcscd_hotplug.sh $pkgdir/usr/lib/udev
  
  install -Dm644 HID_OK_Drivers_EULA $pkgdir/usr/share/licenses/$pkgname/EULA
}
