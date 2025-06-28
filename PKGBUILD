# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.17.1
pkgrel=1
pkgdesc="Bypass DPI"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c910adaef996dc4af83793ce2e6302236c48a7fabead3b5fa8f834c613d560c31b7aab02e4b8763d242cee9890e3b2bc1a255b092b0f69f3258a9f520df5ff7b')
b2sums=('85c948815e372a6c1fd7a28c7cf5495c30c38339dffdcc653b12a01168b114b3010036b3a11095bf1a41ef99ca40f8fc59d1aa315c2a014d877fe5eeb0955c0a')

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
