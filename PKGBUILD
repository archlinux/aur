# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.17.3
pkgrel=1
pkgdesc="Bypass DPI"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ae1bba213cf4db1cfa87389323bc3cb5d9588da86a68fc73669771ea613ce49fe6085c4a836b10a4fe03c318592a8139ed25bafc55c00acfb4b9fa4cc0cdf071')
b2sums=('778444e7918d2987b076e6fbb9fe43921e5d7cd837d62acb05e6bd099d63eef0cad5163644016476b2b90422e02c0337d6c0a8c60aa3e502b87115e72b687480')

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
