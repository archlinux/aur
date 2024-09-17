# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.14.1
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6h armv7h x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=(etc/$pkgname.conf)
source=(
  $pkgname.{conf,service}
  $url/raw/main/LICENSE
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
)
b2sums=('63b1b2d974e9f26dd0cb67ad86c9eb28611444d1db2dc1ce80bb21e8a57a71a2a9d247e3f217ae2ffad9af6f45a9f37f4e7eb57795d28e7cc00c8abe7a464349'
        'f3340917f897d376466c5d3e4c4d6d4e29d929da2f44626e779a80a989a9376082388c941197fc16c78e848e7ee7e38f1a22ffbda5f7cdc6eee5556b4d16bc72'
        'dd51700e972d759a2297bddc15455477a9574b98174e48c6c89236999fb028c09b8eff8a67067bc49e1a8830e43c7a6d76c4c5c644716562818b02320463e1aa'
        'c14af6c2e01bf5d8c1539b5417ca2bf7cdfd501f4f1927dd7d1f643db1b2c7e26cd4bd8e3f66d885903b9349fa10f802e44039f0fc08b28143ec382a64e096b1')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  install -vDm644 $pkgname.conf           -t "$pkgdir"/etc/
  install -vDm755 $pkgname-$pkgver/ciadpi -t "$pkgdir"/usr/bin/
  install -vDm644 $pkgname.service        -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
