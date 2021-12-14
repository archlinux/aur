# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=msieve
pkgver=1.53
pkgrel=1
pkgdesc='Library for factoring large integers'
url='https://sourceforge.net/projects/msieve/'
license=('custom')
arch=('x86_64')
depends=('zlib' 'gmp-ecm')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/project/msieve/msieve/Msieve%20v$pkgver/msieve${pkgver//./}_src.tar.gz")
sha512sums=('e50e8913d38ed4108f5f2ecdbb338968edd416c56c5b7a92d8598b81fc16014ce7c7df963101c65f5bc88d1c7b2d8dbaa572efbecf53d720430a327929c9ce12')

prepare() {
  cd "$pkgname-$pkgver"
  sed \
    -e 's/^CFLAGS =/CFLAGS +=/' \
    -i Makefile
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=' -fopenmp'
  make all ECM=1
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 msieve -t "$pkgdir/usr/bin/"
  install -Dm644 Readme -t "$pkgdir/usr/share/doc/$pkgname/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/doc/$pkgname/Readme "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
