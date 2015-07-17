# Maintainer: James Harvey <jamespharvey20@gmail.com>
# namcap says dependency 'systemd' is not needed, but rdma.service is a systemd script

pkgname=rdma
pkgver=3.00
pkgrel=1
pkgdesc='Remote direct memory access scripts, for kernel InfiniBand and iWARP drivers'
arch=('any')
url=('https://apps.fedoraproject.org/packages/rdma')
license=('GPL2')
depends=('systemd')
source=('70-persistent-ipoib.rules'
        '98-rdma.rules'
        'rdma.conf'
        'rdma-fixup-mtrr.awk'
        'rdma-init-kernel'
        'rdma.service')
# (Fedora's rdma.modules-setup.sh is omitted because it's never used.)
md5sums=('163f7a6b114f9223efce59f8c2b8dafc'
         '3b95c1ce438004f1fc114137efa1455e'
         '9fb936e312afd4b2c1b8ad8d597b7e60'
         'afa0ae69de23d2bd8886c7bae1013f26'
         'e9426ad7097fd001f4c4bd3a39b7dcb9'
         'abb7786f98c132def4592fe40138d2e1')

package() {
  install -Dm644 "${srcdir}/70-persistent-ipoib.rules" "${pkgdir}/usr/lib/udev/rules.d/70-persistent-ipoib.rules"
  install -Dm644 "${srcdir}/98-rdma.rules" "${pkgdir}/usr/lib/udev/rules.d/98-rdma.rules"
  install -Dm644 "${srcdir}/rdma.conf" "${pkgdir}/etc/rdma.conf"
  install -Dm644 "${srcdir}/rdma-fixup-mtrr.awk" "${pkgdir}/usr/lib/rdma/rdma-fixup-mtrr.awk"
  install -Dm755 "${srcdir}/rdma-init-kernel" "${pkgdir}/usr/bin/rdma-init-kernel"
  install -Dm644 "${srcdir}/rdma.service" "${pkgdir}/etc/systemd/system/rdma.service"
}
