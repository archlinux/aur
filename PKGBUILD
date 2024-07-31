# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Pekka Helenius <fincer89 [at] hotmail [dot] com>
# Contributor: David Rodriguez <dissonant.tech@gmail.com>

pkgname=pam_usb
pkgver=0.8.5
pkgrel=1
pkgdesc='Hardware authentication for Linux using ordinary flash media (USB & Card based).'
arch=($CARCH)
url='https://github.com/mcdope/pam_usb'
license=(GPL2)
depends=(python-gobject libxml2 udisks2)
options=(!emptydirs)
backup=("etc/security/pam_usb.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "pamusb-agent.service")
sha256sums=('0f315c601aef0b525f6a41007d89d4fdf91af384ed191cb5147e14f53f35a9ab'
            'f5875f0669b2638f36885c305d719072798b5097b15e6c94a8a852bb896bfc5c')

build() {
  make -C $pkgname-$pkgver
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" PAM_USB_DEST="$pkgdir/usr/lib/security" install
  install -Dt "$pkgdir/usr/lib/systemd/system" -m0644 "pamusb-agent.service"
}
