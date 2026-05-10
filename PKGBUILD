# Maintainer: Petapton <petapton@gmail.com>

pkgname=gnome-shell-extension-custom-command-toggle
pkgver=12
pkgrel=1
pkgdesc='Create customizable GNOME quick-toggle buttons to run user commands and scripts'
arch=('any')
url='https://github.com/StorageB/custom-command-toggle'
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('glib2')
source=("$pkgname-$pkgver.zip::https://github.com/StorageB/custom-command-toggle/releases/download/v$pkgver/custom-command-toggle.zip")
sha256sums=('3a04bd3fd6776ae9e64896a6d89f920be3075cb88f9db222b54c4b6ef443145b')

_uuid='custom-command-toggle@storageb.github.com'

package() {
  local extdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  install -dm755 "$extdir"
  cp -a "$srcdir"/{about.js,backup.js,extension.js,keybinding.js,metadata.json,prefs.js,icons,schemas,LICENSE} "$extdir/"

  find "$extdir" -type d -exec chmod 755 {} +
  find "$extdir" -type f -exec chmod 644 {} +

  glib-compile-schemas "$extdir/schemas"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
