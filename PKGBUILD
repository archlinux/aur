# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Based on https://aur.archlinux.org/packages/ledger-udev by Josh Ellithorpe

pkgname=trezor-udev
pkgver=1
pkgrel=1
pkgdesc='Udev rules to connect trezor hardware wallets to your linux box'
arch=(any)
url='https://github.com/trezor/trezor-common'
license=(LGPL3)
depends=(udev)
install='trezor-udev.install'

source=(https://raw.githubusercontent.com/trezor/trezor-common/master/udev/51-trezor.rules
        https://raw.githubusercontent.com/trezor/trezord-go/master/COPYING)
sha256sums=('f3b39b4537da6260a7b63af07710aedfab1fe87d8eeff0975d176b9b908b9d6e'
            'da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768')
prepare() {
  #Remove plugdev group (Debianism) to remove "systemd-udevd ... Unknown group 'plugdev', ignoring" errors in journal
  #https://wiki.archlinux.org/index.php/Talk:Udev#Use_of_'uaccess'_instead_of_GROUP_and_MODE?
  sed -i 's/MODE="0660",\ GROUP="plugdev",\ //' 51-trezor.rules
}

package() {
  install -Dm 644 51-trezor.rules "$pkgdir"/usr/lib/udev/rules.d/51-trezor.rules
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
