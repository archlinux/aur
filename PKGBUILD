# Maintainer: silentnoodle <lonnqvistben at gmail dot com>
pkgname=yam
pkgver=2.5.8
pkgrel=1
pkgdesc="Game manager for F95zone"
arch=('x86_64')
url="https://github.com/MillenniumEarl/YAM"
license=('MIT')
source=("https://github.com/MillenniumEarl/YAM/releases/download/v${pkgver}/YAM-${pkgver}.AppImage")
sha256sums=('ec60981d349b0dbf1b4446d53ae71b760fde8c1ac77d09ee3603efa2ba5f4937')

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
