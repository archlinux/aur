# Maintainer: Greg Sutcliffe <greg.sutcliffe at gmail dot com>
# Mostly inspired from Debian's cloud-initramfs-growroot

pkgname=mkinitcpio-growrootfs
pkgver=0.1
pkgrel=4
pkgdesc="mkinitcpio hook to autoscale the rootfs to the size of the partition"
url="https://github.com/GregSutcliffe/aur-projects/tree/master/mkinitcpio-growrootfs"
arch=('any')
license=('GPL3')
depends=('util-linux' 'e2fsprogs')
install=${pkgname}.install
source=('growpart'
        'growfs-hook'
        'growfs-install')
sha256sums=('0cd5e003e6fd4eb82e9bc5ef95f0b0739f554c15fcdcb885c8c4454bec3e3710'
            '88483b66ef88c6c13a6bd776740af6c94481e8860d12f11d01f00323946c25e2'
            '656083022534ea34e10926bd63a7efad5a56dbaa5fcb569c2df0201b57a4cd39')

package() {
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/growpart" "${pkgdir}/usr/bin/growpart"

  install -m755 -d "${pkgdir}/usr/lib/initcpio/install"
  install -m644 "${srcdir}/growfs-install" "${pkgdir}/usr/lib/initcpio/install/growfs"

  install -m755 -d "${pkgdir}/usr/lib/initcpio/hooks"
  install -m644 "${srcdir}/growfs-hook" "${pkgdir}/usr/lib/initcpio/hooks/growfs"
}

