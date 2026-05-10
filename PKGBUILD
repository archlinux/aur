# Maintainer: Petapton <petapton@gmail.com>

pkgname=gnome-shell-extension-custom-command-toggle-git
pkgver=12.r32.g3ca7b81
pkgrel=1
pkgdesc='Create customizable GNOME quick-toggle buttons to run user commands and scripts'
arch=('any')
url='https://github.com/StorageB/custom-command-toggle'
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/StorageB/custom-command-toggle.git")
sha256sums=('SKIP')

_uuid='custom-command-toggle@storageb.github.com'

pkgver() {
  cd custom-command-toggle
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  local srcdir="$srcdir/custom-command-toggle"
  local extdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  install -dm755 "$extdir"
  cp -a "$srcdir"/{about.js,backup.js,extension.js,keybinding.js,metadata.json,prefs.js,icons,schemas,LICENSE} "$extdir/"

  find "$extdir" -type d -exec chmod 755 {} +
  find "$extdir" -type f -exec chmod 644 {} +

  glib-compile-schemas "$extdir/schemas"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
