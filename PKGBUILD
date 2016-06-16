# Maintainer: Mark Hamilton <deusstultus@gmail.com>

pkgbase=ath10k-firmware-git
pkgbase=ath10k-firmware-git
pkgname=(${pkgbase%-*}-qca9887-git)
#pkgname=(${pkgbase%-*}-{qca9377,qca9887,qca988x,qca99x0,qca6174}-git)
pkgver=20160613_a5399f1
pkgrel=2
pkgdesc='Firmware for Atheros Ath10k devices not yet in kernel-firmware tree from kvalo repo'
arch=('any')
url="https://github.com/kvalo/ath10k-firmware"
license=('Custom')
depends=('linux-firmware>=20160516')
source=("git+git://github.com/kvalo/ath10k-firmware")
sha256sums=(SKIP)
#conflicts=(kernel-firmware) #Not really, but these files may merge upstream and cause contention on update
pkgver() {
  #Something consistent, there are traces of version numbering in firmware file names
  cd "$srcdir/${pkgbase%-git}"
  git show -s --format=format:%cd_%h --date=short | tr -d '-'
}

package_ath10k-firmware-qca9887-git() {
  #pkgver=10.2.3.31.7
  cd "$srcdir/${pkgbase%-git}"
	mkdir -p "$pkgdir/usr/lib/firmware/ath10k"
  cp -r QCA9887 "$pkgdir/usr/lib/firmware/ath10k"
	mv "$pkgdir/usr/lib/firmware/ath10k/QCA9887/firmware-5.bin_10.2.3.31.7-1" "$pkgdir/usr/lib/firmware/ath10k/QCA9887/firmware-5.bin"
	install -Dm644 LICENSE.qca_firmware "$pkgdir/usr/share/licenses/$pkgname/License.qca_firmware"
}
