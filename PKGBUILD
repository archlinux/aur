# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>
# Contributor: Frikilinux <frikilinux at gmail dot com>
# Contributor: Surefire <surefire at cryptomile.net>

pkgname=gnome-shell-extension-appindicator-git
pkgver=20+0+g159fc2d
pkgrel=1
pkgdesc="Integrates AppIndicators into GNOME Shell."
arch=('any')
url="https://github.com/rgcjonas/gnome-shell-extension-appindicator"
license=('GPL')
makedepends=('git')
depends=('gnome-shell')
optdepends=(
  'libappindicator-gtk2: support GTK+2 applications'
  'libappindicator-gtk3: support GTK+3 applications'
  'libappindicator-sharp: support .net applications'
)
source=("${pkgname}::git+https://github.com/rgcjonas/gnome-shell-extension-appindicator.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/-/+/g'
}

package() {
  cd "${pkgname}"
  # Locate the extension.
  local _extname="$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)"
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

  # Copy extension files into place.
  install -Dm644 -t "${_destdir}"                          ./*.js metadata.json
  install -Dm644 -t "${_destdir}/interfaces-xml"           ./interfaces-xml/*.xml
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" ./interfaces-xml/*.xml
}
