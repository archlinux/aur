# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.16.4
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6 armv7l i686 x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9502fdbede100f0d9fb1d49a9199689e9320739fb989e4c4b601c9fc008e1b8396f09af3fced86ca8d2a3cfc320a853e3e2a86f725b89c069295805029e3cc96')
b2sums=('2ecfe480d97bb3cfca82d25899493e3becbae4ac2124a22ca33ffe0475355985fdfb2e50b4aedd379ecc88d0eaf1a9fadb6d63ad6ef2de42fd38aef16c349306')

prepare() {
  sed -i 's|ciadpi|/usr/bin/ciadpi|' $pkgname-$pkgver/dist/linux/$pkgname.service
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -vDm 644 dist/linux/$pkgname.conf -t "$pkgdir"/etc/
  install -vDm 755 ciadpi -t "$pkgdir"/usr/bin/
  install -vDm 644 dist/linux/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
