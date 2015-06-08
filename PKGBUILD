# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-transmission-daemon-git
_gitname=gnome-shell-extension-transmission-daemon
pkgver=r104.fe6fe88
pkgrel=1
pkgdesc="Gnome Shell indicator for transmission-daemon"
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-transmission-daemon"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-transmission-daemon')
install=${pkgname}.install
source=('git://github.com/eonpatapon/gnome-shell-extension-transmission-daemon.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _uuid='transmission-daemon@patapon.info'

  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  install -d "${pkgdir}/usr/share/glib-2.0/schemas/"

  cd "${srcdir}/${_gitname}"
  mv "${_uuid}/schemas/org.gnome.shell.extensions.mediaplayer.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/"
  cp -af "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:
