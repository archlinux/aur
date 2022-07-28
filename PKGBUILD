# Maintainer: silentnoodle <lonnqvistben at gmail dot com>
pkgname=yam
pkgver=2.6.3
pkgrel=1
pkgdesc="Game manager for F95zone"
arch=('x86_64')
url="https://github.com/MillenniumEarl/YAM"
license=('MIT')
source=("https://github.com/MillenniumEarl/YAM/releases/download/v${pkgver}/YAM-${pkgver}.AppImage")
sha256sums=('c5299051fe9fa7194cb1dcce77b1e81fc0b7d7d792f4234a4ec8fdf43848d03a')

prepare() {
  chmod +x "YAM-${pkgver}.AppImage"
  "./YAM-${pkgver}.AppImage" --appimage-extract &>/dev/null
}

package() {
  # directories
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/yam/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/

  # icon
  install -m644 squashfs-root/yam.png "$pkgdir"/usr/share/icons/

  # .desktop file
  sed -i 's/Exec=AppRun/Exec=yam/' squashfs-root/yam.desktop
  install -m644 squashfs-root/yam.desktop "$pkgdir"/usr/share/applications

  # application
  chmod 755 -R squashfs-root
  mv squashfs-root/* "$pkgdir"/usr/lib/yam/
  ln -s /usr/lib/yam/yam "$pkgdir"/usr/bin/yam
}
