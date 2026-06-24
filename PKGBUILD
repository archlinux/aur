# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=tasks-org-appimage
_pkgname=tasks-org
pkgver=15.7.2
pkgrel=1
pkgdesc="Bringing Astrid Tasks back from the dead"
arch=('x86_64')
url="https://github.com/tasks/tasks"
license=('GPL-3.0')
options=('!strip' '!debug')
provides=('tasks-org')
conflicts=('tasks-org')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/tasks/tasks/releases/download/15.7.2/tasks-org-linux-x86_64.AppImage")
sha256sums=('30f3f1093f792420d263ac919e67ccc8443f81ef1028dc0b99eeca6cd143e594')

package() {
  cd "$srcdir"

  chmod +x "${_pkgname}-${pkgver}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "$pkgdir/usr/bin/tasks-org"

  ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract &>/dev/null

  install -Dm644 "squashfs-root/tasksorg-llc-tasks-org.png" "$pkgdir/usr/share/pixmaps/tasksorg-llc-tasks-org.png"
  install -Dm644 "squashfs-root/org.tasks.desktop" "$pkgdir/usr/share/applications/org.tasks.desktop"
}
