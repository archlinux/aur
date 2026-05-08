# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=tasks-org-appimage
_pkgname=tasks-org
pkgver=15.4.1
pkgrel=1
pkgdesc="Bringing Astrid Tasks back from the dead"
arch=('x86_64')
url="https://github.com/tasks/tasks"
license=('GPL-3.0')
options=('!strip' '!debug')
provides=('tasks-org')
conflicts=('tasks-org')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/tasks/tasks/releases/download/${pkgver}/tasks-org-linux-x86_64.AppImage")
sha256sums=('445c5f069d710e9ed894a01d59819cdaf7fe0fe787606297497f0bb3176e87b3')

package() {
  cd "$srcdir"

  chmod +x "${_pkgname}-${pkgver}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "$pkgdir/usr/bin/tasks-org"

  ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract &>/dev/null

  install -Dm644 "squashfs-root/tasksorg-llc-tasks-org.png" "$pkgdir/usr/share/pixmaps/tasksorg-llc-tasks-org.png"
  install -Dm644 "squashfs-root/org.tasks.desktop" "$pkgdir/usr/share/applications/org.tasks.desktop"
}
