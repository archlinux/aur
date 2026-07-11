# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=tasks-org-appimage
_pkgname=tasks-org
pkgver=15.7.3
pkgrel=1
pkgdesc="Bringing Astrid Tasks back from the dead"
arch=('x86_64')
url="https://github.com/tasks/tasks"
license=('GPL-3.0')
options=('!strip' '!debug')
provides=('tasks-org')
conflicts=('tasks-org')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/tasks/tasks/releases/download/15.7.3/tasks-org-linux-x86_64.AppImage")
sha256sums=('01c7dedbf76ff98125ce84f1177f4565345ec6b51a1b0c9cf9a13605be6f60d4')

package() {
  cd "$srcdir"

  chmod +x "${_pkgname}-${pkgver}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "$pkgdir/usr/bin/tasks-org"

  ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract &>/dev/null

  install -Dm644 "squashfs-root/tasksorg-llc-tasks-org.png" "$pkgdir/usr/share/pixmaps/tasksorg-llc-tasks-org.png"
  install -Dm644 "squashfs-root/org.tasks.desktop" "$pkgdir/usr/share/applications/org.tasks.desktop"
}
