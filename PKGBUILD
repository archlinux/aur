# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>

pkgname=gnome-shell-extension-rounded-window-corners-reborn
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
url='https://github.com/flexagoon/rounded-window-corners'
license=('GPL-3.0-or-later')

pkgver=12.c0a5905
pkgrel=1

arch=('any')
depends=('gnome-shell')

source=('https://github.com/GrzegorzKozub/aur/raw/master/gnome-shell-extension-rounded-window-corners-reborn/rounded-window-corners@fxgn.shell-extension.zip')
sha256sums=('6e3618e001d40898757a2b6f02fb3f6acb75eb9a64ce08910932f59d640c2ef1')

package() {
  local uuid='rounded-window-corners@fxgn'
  local extdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d ${extdir}
  bsdtar -xvf "${uuid}.shell-extension.zip" -C ${extdir} --no-same-owner

  mv "${extdir}/locale" "${pkgdir}/usr/share/"

  install -Dm644 \
    "${extdir}/schemas/org.gnome.shell.extensions.rounded-window-corners.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -rf "${extdir}/schemas/"
}
