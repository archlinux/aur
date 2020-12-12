# Maintainer: zapp-brannigan <fuerst.reinje@web.de>
#             danhyal <danhyal@gmail.com>
#             jgottula
_pkgname=kvdo
pkgname=kvdo-dkms
pkgrel=2
pkgver=6.2.4.26
pkgdesc='A pair of kernel modules which provide pools of deduplicated and/or compressed block storage (semi-official version for latest kernels)'
arch=('x86_64')
url="https://github.com/rhawalsh/kvdo"
license=('GPL2')
provides=('kvdo')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/rhawalsh/kvdo/archive/$pkgver-COPR.tar.gz"
        "dkms.conf"
        "config_hz.patch")
sha256sums=('78f0a02aeb69d65010184d836ea3da2b2430cdd480cb58a4793fe4e980371924'
            '516f60bdb28f7a0cb6c8f1f84c656ee7c6aec8feb393538f227ed515372ac88a'
            '8871d201fef0b4ae8ea4a3459e7a3b375b5d104df110dcbf56c8da929c68b946')

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$_pkgname-$pkgver-COPR" "$pkgdir"/usr/src/"$_pkgname-$pkgver"
  cd "$pkgdir"/usr/src/kvdo-"$pkgver"
  patch --forward --strip=0 -i "$srcdir"/config_hz.patch
  cd "$srcdir"
  sed -e "s/@PKGVER@/${pkgver}/" dkms.conf > "$pkgdir"/usr/src/"$_pkgname-$pkgver"/dkms.conf
}
