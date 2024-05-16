# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ddcutil-service
pkgver=1.0.7
pkgrel=1
pkgdesc="A Dbus ddcutil server for control of DDC Monitors/VDUs"
arch=('x86_64')
url="https://github.com/digitaltrails/ddcutil-service"
license=('GPL-2.0-or-later')
depends=('ddcutil')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('58a26f611e5ec69e1dcd90a6e9609564a6d489fa54cc5f25b12a451eb805f40e')

prepare() {
  cd "$pkgname-$pkgver"
  make clean
}

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 com.ddcutil.DdcutilService.service -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 "i2c-dev/$pkgname.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "$pkgname.7" -t "$pkgdir/usr/share/man/man7/"
  install -Dm644 docs/html/*.html -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname"
}
