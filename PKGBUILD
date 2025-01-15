# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.16
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6 armv7l i686 x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=(etc/$pkgname.conf)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('7a80864864a736d68824596dbe086bb4a6f90661fd02a2231c7c023ab7b098e5b38f73fa8acb8adc5f73de16d328875d42bdd3fd5f4dd34f40d9d51fd8b22e5e')

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
