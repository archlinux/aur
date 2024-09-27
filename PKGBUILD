# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.14.1
pkgrel=2
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6h armv7h x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=(etc/$pkgname.conf)
source=(
  $url/raw/main/dist/linux/$pkgname.{conf,service}
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
)
b2sums=('a00ad63914d0af3a6e44a968e8dba9af7051db841a4db913f2534d45b5122ade8974444ccdc612e0562d3bf3a9cb9fb868f453db29c8c6cc6a770793c826cc3f'
        '639fc319c8273d0c727fd8805b271cb4a415ef1df29f261369d86a836ae2a0dd00d34b51298fc06fd41a3957e144277a1a2508fefebfaee60dd5813b6242e871'
        'c14af6c2e01bf5d8c1539b5417ca2bf7cdfd501f4f1927dd7d1f643db1b2c7e26cd4bd8e3f66d885903b9349fa10f802e44039f0fc08b28143ec382a64e096b1')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  install -vDm644 $pkgname.conf            -t "$pkgdir"/etc/
  install -vDm755 $pkgname-$pkgver/ciadpi  -t "$pkgdir"/usr/bin/
  install -vDm644 $pkgname.service         -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
