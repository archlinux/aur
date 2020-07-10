# Author: Tom Debruyne

pkgname=jailkit
pkgver=2.21
pkgrel=2
pkgdesc="A set of utilities to limit user accounts to specific files ."
arch=('x86_64')
url="https://olivier.sessink.nl/jailkit/"
license=('libtirpc')
depends=()
optdepends=()
source=(https://olivier.sessink.nl/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('6ebdd5d2840d760840f4d279033e7484c50e21a083d69204e36b37e7743cbd6fed6e358a1083c8fc64dfb9f1173a4f14500e5d96925e94ba0231ce01eb47bd15')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir"/usr/sbin/
}
