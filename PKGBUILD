# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=gnome-shell-extension-hide-universal-access
pkgver=10
pkgrel=2
pkgdesc='Hide Universal Access icon from the Gnome status bar'
arch=(any)
url='https://github.com/akiirui/hide-universal-access'
license=('GPL3')
depends=('gnome-shell')
source=("https://extensions.gnome.org/extension-data/hide-universal-accessakiirui.github.io.v${pkgver}.shell-extension.zip")
sha256sums=('122a3bbb9dd57d1a15b6fc267c33d373f72d662cc6d21574a28b2579928aff0e')

prepare() {
  # Patch for Gnome 42
  sed -i 's/    "41"/    "41",\n    "42"/g' metadata.json
}

package() {
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 -t "${_destdir}" metadata.json *.js
}
