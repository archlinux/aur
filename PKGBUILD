# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-drop-down-terminal-git
_gitname=gs-extensions-drop-down-terminal
pkgver=17.r0.g18ffa31
pkgrel=1
pkgdesc="Drop Down Terminal extension for the Gnome Shell"
arch=('any')
url="https://github.com/zzrough/gs-extensions-drop-down-terminal"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-drop-down-terminal')
conflicts=('gnome-shell-extension-drop-down-terminal')
install=${pkgname}.install
source=('git://github.com/zzrough/gs-extensions-drop-down-terminal')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _uuid='drop-down-terminal@gs-extensions.zzrough.org'

  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  install -d "${pkgdir}/usr/share/glib-2.0/schemas/"

  cd "${srcdir}/${_gitname}"
  mv "${_uuid}/org.zzrough.gs-extensions.drop-down-terminal.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/"
  cp -af "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:
