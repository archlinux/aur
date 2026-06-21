# Maintainer: Petapton <petapton@gmail.com>

pkgname=gnome-shell-extension-custom-command-toggle
pkgver=13
pkgrel=1
pkgdesc='Create customizable GNOME quick-toggle buttons to run user commands and scripts'
arch=('any')
url='https://github.com/StorageB/custom-command-toggle'
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('glib2')
source=("$pkgname-$pkgver.zip::https://github.com/StorageB/custom-command-toggle/releases/download/v$pkgver/custom-command-toggle.zip")
sha256sums=('8fcb42a3a5670ff23be1f0b6512abb3af06d0cb29d2f3c100d441f1e98cd300e')

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
