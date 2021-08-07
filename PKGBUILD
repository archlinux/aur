# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Frane Bandov <frane@offbyte.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=log4net
pkgver=2.0.12
pkgrel=2
pkgdesc="A tool to help the programmer output log statements to a variety of output targets"
arch=('any')
url="https://logging.apache.org/log4net/"
license=('Apache')
depends=('mono')
source=(
  https://downloads.apache.org/logging/$pkgname/binaries/apache-$pkgname-binaries-$pkgver.zip
  $pkgname.pc
)
sha512sums=(
  '7c98c96272f1627c6db171554731c1624d138f3d1de9013031a96b91a7a7be03d657e21a25dadd9139c134c6d55d1f1c3277d89b4dc1fc75c68603b70c1c1e3c'
  'a6e46ce91a5896a7c1ff91554ef742c40b2c04d03c0c7004f369488d3d1892f7c948f86a1b604e54a258a550017c6494eecfcc8a38d1b0796746d77edd47a23e'
)

prepare() {
  sed -i "s/@VERSION@/$pkgver/" "$srcdir/$pkgname.pc"
}
package() {
  gacutil -i net20/$pkgname.dll -package $pkgname -root "$pkgdir/usr/lib/mono/${pkgname}20/"
  install -Dm644 "$srcdir/$pkgname.pc" "$pkgdir/usr/share/pkgconfig/$pkgname.pc"
}
