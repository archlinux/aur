# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Frane Bandov <frane@offbyte.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=log4net
pkgver=2.0.12
pkgrel=1
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
  '1f8068d6373fdedc47e624583b6b36879ee4722b27f38938c36e3d82a6bfd1f07c1f164700fc4bef8a23e506b2a1bfa63c1e8e0c85118ef3cb14b6aa3ed0b2f7'
)

prepare() {
  sed -i "s/@VERSION@/$pkgver/"  "$srcdir/$pkgname.pc"
}

package() {
  for ABSDIR in $srcdir/*; do
    if [ -d $ABSDIR ]; then
      DIRNAME=$(echo $ABSDIR | awk -F'/' '{ print $NF }')
      gacutil -i $DIRNAME/$pkgname.dll -package $pkgname/$DIRNAME -root "$pkgdir/usr/lib/mono/${pkgname}/$DIRNAME/"
    fi
  done
  install -Dm644 "$srcdir/$pkgname.pc" "$pkgdir/usr/share/pkgconfig/$pkgname.pc"
}
