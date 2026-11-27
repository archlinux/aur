pkgname=raid-util-bin
pkgver=3.0.1
pkgrel=2
pkgdesc="A simple and modern GUI for managing RAID."
arch=('x86_64')
license=('MIT')
url="https://github.com/mijocecr/raid-util"

depends=(
  'mdadm'          # manejo de RAID
  'util-linux'     # lsblk, mount, umount, blkid, sfdisk
  'smartmontools'  # smartctl
  'gptfdisk'       # sgdisk (necesario para la limpieza profunda v3)
)

options=('!debug' '!strip')

source=("https://github.com/mijocecr/raid-util/releases/download/raid-util_v3.0.1/RAID-Util.tar.gz")
sha256sums=('3d92e0ad33b5f408cfea5a043e0c193bed7469ca21a49e1157213fc9d4bd5b6f')

package() {
  install -d "$pkgdir/usr/lib/raid-util"

  # Copiar el contenido descomprimido excluyendo el archivo tar.gz fuente
  find "$srcdir" -maxdepth 1 ! -name "." ! -name "RAID-Util.tar.gz" -exec cp -r {} "$pkgdir/usr/lib/raid-util/" \;

  # Symlink del binario principal
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/raid-util/RAID-Util "$pkgdir/usr/bin/raid-util"

  # Lanzador de escritorio e icono
  install -Dm644 "$srcdir/raid-util.desktop" "$pkgdir/usr/share/applications/raid-util.desktop"
  install -Dm644 "$srcdir/raid-util.png" "$pkgdir/usr/share/pixmaps/raid-util.png"
}
