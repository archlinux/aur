# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.16.3
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6 armv7l i686 x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6b85695735ef7075d457152eccd216d599173e4569cd51a0e28e17e3d7974e087683234cc178f097f973035f70d4e43de8db5aa702260a2148cae3a66957634e')
b2sums=('3feee02c8bd529f2b9a19eb6b87f84f7f7835e3e05813ea45b9860f852c19000dd404f64488d82463190e6986a4c5dd18f377743223406306edfb6bb38eff285')

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
