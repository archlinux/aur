# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>

pkgname=gnome-shell-extension-rounded-window-corners-reborn
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
url='https://github.com/flexagoon/rounded-window-corners'
license=('GPL-3.0-or-later')

pkgver=13.5c31dc9
pkgrel=1

arch=('any')
depends=('gnome-shell')

source=("https://github.com/GrzegorzKozub/aur/raw/master/gnome-shell-extension-rounded-window-corners-reborn/rounded-window-corners@fxgn.shell-extension-${pkgver}.zip")
sha256sums=('5505961bd8ccb8cddda5a44fe68cfae26be1c6179f26a242bb0032d43901643f')

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
