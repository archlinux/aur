# Maintainer: zapp-brannigan <fuerst.reinje@web.de>
#             danhyal <danhyal@gmail.com>
#             jgottula
_pkgname=kvdo
pkgname=kvdo-dkms
pkgrel=1
pkgver=6.2.3.114
pkgdesc='A pair of kernel modules which provide pools of deduplicated and/or compressed block storage'
arch=('x86_64')
url="https://github.com/dm-vdo/kvdo"
license=('GPL2')
provides=('kvdo')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/kvdo/archive/$pkgver.tar.gz"
        "dkms.conf"
        "vla-warning.patch"
        "config_hz.patch")
sha256sums=('46c31cf7921053696eb0c3db6e3b94aae49cf6fe19145baf0f920d479b6f7caa'
            '516f60bdb28f7a0cb6c8f1f84c656ee7c6aec8feb393538f227ed515372ac88a'
            'a6b9a42ef6c0933ff02fe304f9ab627f045f83abc8ed33cf0b91522096cade0f'
            '8871d201fef0b4ae8ea4a3459e7a3b375b5d104df110dcbf56c8da929c68b946')

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$_pkgname-$pkgver" "$pkgdir"/usr/src/"$_pkgname-$pkgver"
  cd "$pkgdir"/usr/src/kvdo-"$pkgver"
  patch --forward --strip=1 -i "$srcdir"/vla-warning.patch
  patch --forward --strip=0 -i "$srcdir"/config_hz.patch
  cd "$srcdir"
  sed -e "s/@PKGVER@/${pkgver}/" dkms.conf > "$pkgdir"/usr/src/"$_pkgname-$pkgver"/dkms.conf
}
