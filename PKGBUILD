# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>

pkgname=gnome-shell-extension-rounded-window-corners-reborn
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
url='https://github.com/flexagoon/rounded-window-corners'
license=('GPL-3.0-or-later')

pkgver=3.439a9e3
pkgrel=2

arch=('any')
depends=('gnome-shell')

source=("https://github.com/GrzegorzKozub/aur/raw/master/gnome-shell-extension-rounded-window-corners-reborn/rounded-window-corners@fxgn.shell-extension-${pkgver}.zip")
sha256sums=('1db1d94fad8b171241126ee65f8840753d228229279b657ffee2b7ccc07ffce1')

package() {
  local uuid='rounded-window-corners@fxgn'
  local extdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d ${extdir}
  bsdtar -xvf "${uuid}.shell-extension-${pkgver}.zip" -C ${extdir} --no-same-owner

  mv "${extdir}/locale" "${pkgdir}/usr/share/"

  install -Dm644 \
    "${extdir}/schemas/org.gnome.shell.extensions.rounded-window-corners-reborn.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -rf "${extdir}/schemas/"
}
