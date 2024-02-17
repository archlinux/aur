# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ddcutil-service
pkgver=1.0.0
pkgrel=1
pkgdesc="A Dbus ddcutil server for control of DDC Monitors/VDUs"
arch=('x86_64')
url="https://github.com/digitaltrails/ddcutil-service"
license=('GPL-2.0-or-later')
depends=('ddcutil')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f108d1a3a378fd18e9b37a52f6d9b1914650d3cb6bca6df8bea88568da0054dc')

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
