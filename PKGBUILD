# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/kvalo/ath10k-firmware/

_gituser=kvalo
_gitname=ath10k-firmware
_gitver=4b96aa0c1d73947de7ccc0dcb89e2a2e3813f708

pkgname=firmware_ath10k-qca6174
pkgbase=${pkgname}
pkgver=0.1
pkgrel=6
pkgdesc='firmware for Atheros Qualcomm Killer N1525 Wireless-AC [168c:003e]'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL')
source=("https://github.com/$_gituser/$_gitname/archive/$_gitver.tar.gz"
				"ath10k.conf")
md5sums=('5396306797a46bf2138ed05e26c199be'
				 'fce5dbe873ca616de7d519cb55af8e68')

package() {
  cd "$srcdir/"
  mkdir -p $pkgdir/etc/modprobe.d
  cp ath10k.conf $pkgdir/etc/modprobe.d/ath10k.conf
  cd "$_gitname-$_gitver"
  mv hw2.1/firmware-5.bin_SW_RM.1.1.1-00157-QCARMSWPZ-1 hw2.1/firmware-5.bin
  mv hw3.0/firmware-4.bin_WLAN.RM.2.0-00180-QCARMSWPZ-1 hw3.0/firmware-4.bin
  DESTDIR="$pkgdir/usr/lib/firmware/ath10k/"
  mkdir -p $DESTDIR
  cp -r QCA6174 "$DESTDIR"
}
