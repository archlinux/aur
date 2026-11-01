# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_name=dux-plugin-hass
pkgname="dux-shell-plugin-hass-git"
pkgver=r71.bd95ce0
pkgrel=1
pkgdesc="Home Assistant monitoring and management plugin for Dux Shell."
arch=('any')
url="https://github.com/xxyangyoulin/dms-plugin-hass"
license=('MIT')
depends=('dux-shell')
makedepends=('git')
provides=('dux-shell-plugin-hass')
replaces=('dms-shell-plugin-hass-git')
install=dux-shell-plugins.install
source=("$_name::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -d -m 755 "${pkgdir}/usr/share/quickshell/dux-shell/plugins/homeAssistantMonitor"
  cp -rdp --no-preserve=ownership "${_name}"/* "${pkgdir}/usr/share/quickshell/dux-shell/plugins/homeAssistantMonitor"
}
