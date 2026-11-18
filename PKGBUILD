# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnome-shell-extension-rounded-window-corners-reborn
pkgver=20261118.cb2c8fb
pkgrel=1
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
arch=(any)
url=https://github.com/GrzegorzKozub/rounded-window-corners
license=(GPL-3.0-or-later)
depends=(gnome-shell)
source=("$pkgname-$pkgver.zip::https://github.com/GrzegorzKozub/rounded-window-corners/releases/download/v$pkgver/rounded-window-corners@fxgn.shell-extension.zip")
sha256sums=('edf9dc21b4052fe762e89630bd2615f74955d72eda90c32a1eb31ba5ee54ee38')

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
