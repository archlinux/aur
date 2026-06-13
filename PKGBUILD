pkgname=raid-util-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple and modern GUI for managing RAID."
arch=('x86_64')
license=('MIT')
url="https://github.com/mijocecr/raid-util"

depends=(
  'mdadm'          # manejo de RAID
  'util-linux'     # lsblk, mount, umount, blkid, sfdisk
  'smartmontools'  # smartctl
  'gptfdisk'       # sgdisk
)

options=('!debug' '!strip')

source=("https://github.com/mijocecr/raid-util/releases/download/raid-util_v1.0/RAID-Util.tar.gz")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/lib/raid-util"

  # Copiar solo el contenido del tarball
  cp "$srcdir"/* "$pkgdir/usr/lib/raid-util/"


  # Symlink del binario
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/raid-util/RAID-Util "$pkgdir/usr/bin/raid-util"

  # Desktop + icono
  install -Dm644 "$srcdir/raid-util.desktop" "$pkgdir/usr/share/applications/raid-util.desktop"
  install -Dm644 "$srcdir/raid-util.png" "$pkgdir/usr/share/pixmaps/raid-util.png"
}
