# Maintainer: zapp-brannigan <fuerst.reinje@web.de>
#             danhyal <danhyal@gmail.com>
#             jgottula
_pkgname=kvdo
pkgname=kvdo-dkms
pkgrel=1
pkgver=8.2.0.2
pkgdesc='A pair of kernel modules which provide pools of deduplicated and/or compressed block storage '
arch=('x86_64')
url="https://github.com/dm-vdo/kvdo"
license=('GPL2')
provides=('kvdo')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/kvdo/archive/$pkgver.tar.gz"
        "dkms.conf"
        "config_hz.patch"
	"stdarg-kernel-path-fix.patch"
)
sha256sums=('bcc0a122ba18f04c3d4432665aea285d001f9e64a9482a99c8cba05266b2af61'
            '923b125540ba93a029100c8faa91d29d64bc33196120f5072146b88d9c7359ee'
            'bd4c32b8496714e9a998fed0f0114076c61e50cf1a51ebf52180b728cb1bbd9c'
            '1af3ab2a0ca1eccca52f55335a3ae8a4e3704a9919ad0551ce85082630381ed1'
)

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$_pkgname-$pkgver" "$pkgdir"/usr/src/"$_pkgname-$pkgver"
  cd "$pkgdir"/usr/src/kvdo-"$pkgver"
  msg2 "Placing dkms.conf"
  cd "$srcdir"
  sed -e "s/@PKGVER@/${pkgver}/" dkms.conf > "$pkgdir"/usr/src/"$_pkgname-$pkgver"/dkms.conf
}
