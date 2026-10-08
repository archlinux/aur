# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnome-shell-extension-rounded-window-corners-reborn
pkgver=20261008.8f312a8
pkgrel=1
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
arch=(any)
url=https://github.com/GrzegorzKozub/rounded-window-corners
license=(GPL-3.0-or-later)
depends=(gnome-shell)
source=("$pkgname-$pkgver.zip::https://github.com/GrzegorzKozub/rounded-window-corners/releases/download/v$pkgver/rounded-window-corners@fxgn.shell-extension.zip")
sha256sums=('0eeaa56f8309077644dc37a0caafe841a1d1227d8339f61834990f927c2a09cd')

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
