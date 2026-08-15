# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=tasks-org-appimage
_pkgname=tasks-org
pkgver=15.9.1
pkgrel=1
pkgdesc="Bringing Astrid Tasks back from the dead"
arch=('x86_64')
url="https://github.com/tasks/tasks"
license=('GPL-3.0')
options=('!strip' '!debug')
provides=('tasks-org')
conflicts=('tasks-org')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/tasks/tasks/releases/download/15.9.1/tasks-org-linux-x86_64.AppImage")
sha256sums=('26a2ad803c513d32ada834815171988eb02ca804d1cf99d8f0116e80bae2903e')

package() {
  cd "$srcdir"

  chmod +x "${_pkgname}-${pkgver}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "$pkgdir/usr/bin/tasks-org"

  ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract &>/dev/null

  install -Dm644 "squashfs-root/tasksorg-llc-tasks-org.png" "$pkgdir/usr/share/pixmaps/tasksorg-llc-tasks-org.png"
  install -Dm644 "squashfs-root/org.tasks.desktop" "$pkgdir/usr/share/applications/org.tasks.desktop"
}
