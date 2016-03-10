# Maintainer: Mark Hamilton <deusstultus@gmail.com>

pkgbase=ath10k-firmware-git
pkgbase=ath10k-firmware-git
pkgname=(${pkgbase%-*}-{qca9377,qca9887}-git)
#pkgname=(${pkgbase%-*}-{qca9377,qca9887,qca988x,qca99x0,qca6174}-git)
pkgver=20160226_f428f53
pkgrel=2
pkgdesc='Firmware for Atheros Ath10k devices not yet in kernel-firmware tree from kvalo repo'
arch=('any')
url="https://github.com/kvalo/ath10k-firmware"
license=('Custom')
source=("git+git://github.com/kvalo/ath10k-firmware")
sha256sums=(SKIP)
#conflicts=(kernel-firmware) #Not really, but these files may merge upstream and cause contention on update
pkgver() {
  #Something consistent, there are traces of version numbering in firmware file names
  cd "$srcdir/${pkgbase%-git}"
  git show -s --format=format:%cd_%h --date=short | tr -d '-'
}

package_ath10k-firmware-qca9377-git() {
  #pkgver=1.0.00267
  cd "$srcdir/${pkgbase%-git}"
	mkdir -p "$pkgdir/usr/lib/firmware/ath10k"
	cp -r QCA9377 "$pkgdir/usr/lib/firmware/ath10k"
	mv "$pkgdir/usr/lib/firmware/ath10k/QCA9377/hw1.0/firmware-5.bin_WLAN.TF.1.0-00267-1" "$pkgdir/usr/lib/firmware/ath10k/QCA9377/hw1.0/firmware-5.bin"
	install -Dm644 LICENSE.qca_firmware "$pkgdir/usr/share/licenses/$pkgname/License.qca_firmware"
}

package_ath10k-firmware-qca9887-git() {
  #pkgver=10.2.3.31.7
  cd "$srcdir/${pkgbase%-git}"
	mkdir -p "$pkgdir/usr/lib/firmware/ath10k"
  cp -r QCA9887 "$pkgdir/usr/lib/firmware/ath10k"
	mv "$pkgdir/usr/lib/firmware/ath10k/QCA9887/firmware-5.bin_10.2.3.31.7-1" "$pkgdir/usr/lib/firmware/ath10k/QCA9887/firmware-5.bin"
	install -Dm644 LICENSE.qca_firmware "$pkgdir/usr/share/licenses/$pkgname/License.qca_firmware"
}
