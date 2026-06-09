pkgname=raid-util-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple and modern GUI for managing RAID."
arch=('x86_64')
license=('MIT')
url="https://github.com/mijocecr/raid-util"


depends=(
  'mdadm'          # manejo de RAID: crear, ensamblar, eliminar, zero-superblock
  'util-linux'     # lsblk, mount, umount, blkid, sfdisk
  'smartmontools'  # smartctl (SMART health)
  'gptfdisk'       # sgdisk (GPT)
)



options=('!debug' '!strip')

source=("https://github.com/mijocecr/raid-util/releases/download/raid-util_v1.0/RAID-Util.tar.gz")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/lib/raid-util"
  cp -r "$srcdir"/* "$pkgdir/usr/lib/raid-util/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/iscsi-util/ISCSI-Util "$pkgdir/usr/bin/raid-util"

  install -Dm644 "$srcdir/raid-util.desktop" "$pkgdir/usr/share/applications/raid-util.desktop"
  install -Dm644 "$srcdir/raid-util.png" "$pkgdir/usr/share/pixmaps/raid-util.png"
}
