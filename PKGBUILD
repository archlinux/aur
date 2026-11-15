pkgname=iscsi-util-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="A simple and modern GUI for managing iSCSI."
arch=('x86_64')
license=('MIT')
url="https://github.com/mijocecr/iscsi-util"

depends=(
  'open-iscsi'     # iscsid + iscsiadm
  'libnotify'      # notificaciones
  'gptfdisk'       # sgdisk
  'util-linux'     # mount, umount, lsblk, blkid
  'e2fsprogs'      # mkfs.ext4
  'xfsprogs'       # mkfs.xfs
  'btrfs-progs'    # mkfs.btrfs
  'f2fs-tools'     # mkfs.f2fs
  'ntfs-3g'        # mkfs.ntfs
  'exfatprogs'     # mkfs.exfat
  'systemd'        # servicios
  'cifs-utils'     # montajes SMB
)

options=('!debug' '!strip')

source=("https://github.com/mijocecr/iscsi-util/releases/download/iscsi-util_5.0.1/ISCSI-Util.tar.gz")
sha256sums=('eddb51874d22669b7fdb95ac38fc8a30264a26736e4de2b6749e31965d7b18ae')

package() {
  install -d "$pkgdir/usr/lib/iscsi-util"
  cp -r "$srcdir"/* "$pkgdir/usr/lib/iscsi-util/"

  # Asegurar permisos de ejecución en el binario principal
  chmod +x "$pkgdir/usr/lib/iscsi-util/ISCSI-Util"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/iscsi-util/ISCSI-Util "$pkgdir/usr/bin/iscsi-util"

  install -Dm644 "$srcdir/iscsi-util.desktop" "$pkgdir/usr/share/applications/iscsi-util.desktop"
  install -Dm644 "$srcdir/iscsi-util.png" "$pkgdir/usr/share/pixmaps/iscsi-util.png"
}
