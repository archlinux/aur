# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.15
pkgrel=2
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6h armv7h x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=(etc/$pkgname.conf)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('adceb3106c16d8aefe2040d8f12d9118107b23d2eac57f4a295f7800b655e889e6507f8800d1f0cc46e1365df2c987c764c68f6ab3df9a0dee3a226746e195c7')

prepare() {
  sed -i 's|ExecStart=ciadpi|ExecStart=/usr/bin/ciadpi|' $pkgname-$pkgver/dist/linux/$pkgname.service
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -vDm644 dist/linux/$pkgname.conf    -t "$pkgdir"/etc/
  install -vDm755 ciadpi                      -t "$pkgdir"/usr/bin/
  install -vDm644 dist/linux/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                     -t "$pkgdir"/usr/share/licenses/$pkgname/
}
