# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_name=dms-plugin-hass
pkgname="dms-shell-plugin-hass-git"
pkgver=r41.0d3cd45
pkgrel=1
pkgdesc="Home Assistant entity monitoring and management plugin for DankMaterialShell."
arch=('any')
url="https://github.com/xxyangyoulin/dms-plugin-hass"
license=('MIT')
depends=('dms-shell')
makedepends=('git')
provides=('dms-shell-plugin-hass')
install=dms-shell-plugins.install
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
  install -dm755 "${pkgdir}/usr/share/quickshell/dms/PLUGINS/homeAssistantMonitor"
  cp -r --no-preserve=ownership dms-plugin-hass/* "${pkgdir}/usr/share/quickshell/dms/PLUGINS/homeAssistantMonitor"
}
