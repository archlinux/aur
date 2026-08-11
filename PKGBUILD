# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnome-shell-extension-rounded-window-corners-reborn
pkgver=20260806.db43c44
pkgrel=1
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
arch=(any)
url=https://github.com/GrzegorzKozub/rounded-window-corners
license=(GPL-3.0-or-later)
depends=(gnome-shell)
source=("$pkgname-$pkgver.zip::https://github.com/GrzegorzKozub/rounded-window-corners/releases/download/v$pkgver/rounded-window-corners@fxgn.shell-extension.zip")
sha256sums=('e9deee18c04b22f3fb49de9b2234611745b523b8fea56ec787c74d33f38b09d8')

package() {
  local uuid=rounded-window-corners@fxgn
  local extdir="$pkgdir"/usr/share/gnome-shell/extensions/"$uuid"
  install -d "$extdir"
  bsdtar -xvf "$pkgname-$pkgver".zip -C "$extdir" --no-same-owner
  mv "$extdir"/locale "$pkgdir"/usr/share/
  install -Dm644 \
    "$extdir"/schemas/org.gnome.shell.extensions.rounded-window-corners-reborn.gschema.xml \
    -t "$pkgdir"/usr/share/glib-2.0/schemas/
  rm -rf "$extdir"/schemas/
}
