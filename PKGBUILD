# Maintainer: uvz0 (rehanjayed01@gmail.com)
# Copyright (c) 2026 Author. All Rights Reserved.
pkgname=hyprcursor-sync-git
pkgver=r1.1
pkgrel=3
pkgdesc="Automated cursor sync, So you dont need to log-in-n-out just to check if your cursor is changed or not :)"
arch=('any')
url="https://github.com/uvz0/hyprcursor-sync"
license=('MIT')
depends=('hyprland' 'bash' 'glib2' 'gtk4')
makedepends=('git')
install=${pkgname}.install
source=("git+https://github.com/uvz0/hyprcursor-sync.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/hyprcursor-sync"

  install -Dm755 cursor-update.sh "$pkgdir/usr/bin/cursor-update-script"
  install -Dm644 cursor-update.service "$pkgdir/usr/lib/systemd/user/cursor-update.service"
  install -Dm644 cursor-update.path "$pkgdir/usr/lib/systemd/user/cursor-update.path"

  sed -i 's|%h/.config/systemd/user/cursor-update.sh|/usr/bin/cursor-update-script|g' \
    "$pkgdir/usr/lib/systemd/user/cursor-update.service"
}
