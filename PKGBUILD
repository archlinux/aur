# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Pekka Helenius <fincer89 [at] hotmail [dot] com>
# Contributor: David Rodriguez <dissonant.tech@gmail.com>

pkgname=pam_usb
pkgver=0.8.2
pkgrel=2
pkgdesc='Hardware authentication for Linux using ordinary flash media (USB & Card based).'
arch=($CARCH)
url='https://github.com/mcdope/pam_usb'
license=(GPLv2)
depends=(pam dbus python python-dbus python-lxml python-gobject udisks2)
options=(!emptydirs)
backup=("etc/security/pam_usb.conf")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e6d49c1a8b01af165c7c98ead9dc28020e8da138cb9c7e0906350477af5ae531')

build() {
  make -C $pkgname-$pkgver
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" PAM_USB_DEST="$pkgdir/usr/lib/security" install
  install -Dt $pkgdir/usr/lib/systemd/system -m0644 $pkgname-$pkgver/arch_linux/pamusb-agent.service
}
