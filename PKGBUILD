# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Pekka Helenius <fincer89 [at] hotmail [dot] com>
# Contributor: David Rodriguez <dissonant.tech@gmail.com>

pkgname=pam_usb
pkgver=0.8.2
pkgrel=1
pkgdesc='Hardware authentication for Linux using ordinary flash media (USB & Card based).'
arch=($CARCH)
url='https://github.com/mcdope/pam_usb'
license=(GPLv2)
depends=(pam dbus python python-dbus python-lxml python-gobject udisks2)
options=(!emptydirs)
backup=("etc/security/pam_usb.conf")
source=("$url/releases/tag/$pkgver")
sha256sums=('8c24c792376d99d150e29e5bca9ecfe43f0432573a6c275d898fb7ea0ac27f16')

build() {
  make -C $pkgname
}

package() {
  make -C $pkgname DESTDIR="$pkgdir" PAM_USB_DEST="$pkgdir/usr/lib/security" install
  install -Dt $pkgdir/usr/lib/systemd/system -m0644 $pkgname/arch_linux/pamusb-agent.service
}
