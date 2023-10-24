# Maintainer: zapp-brannigan <fuerst.reinje@web.de>
#             danhyal <danhyal@gmail.com>
#             jgottula
_pkgname=kvdo
pkgname=kvdo-dkms
pkgrel=2
pkgver=8.2.3.3
pkgdesc='A pair of kernel modules which provide pools of deduplicated and/or compressed block storage '
arch=('x86_64')
url="https://github.com/dm-vdo/kvdo"
license=('GPL2')
depends=('dkms')
provides=('kvdo')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/kvdo/archive/$pkgver.tar.gz"
        "dkms.conf"
)
sha256sums=('9f0dbda093faa43769198ce7057b80da9d56747e843db84b3dab36436737506b'
            '923b125540ba93a029100c8faa91d29d64bc33196120f5072146b88d9c7359ee'
)

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$_pkgname-$pkgver" "$pkgdir"/usr/src/"$_pkgname-$pkgver"
  cd "$pkgdir"/usr/src/kvdo-"$pkgver"
  msg2 "Placing dkms.conf"
  cd "$srcdir"
  sed -e "s/@PKGVER@/${pkgver}/" dkms.conf > "$pkgdir"/usr/src/"$_pkgname-$pkgver"/dkms.conf
}
