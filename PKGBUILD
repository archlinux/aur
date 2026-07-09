# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_name=dms-plugin-nut
pkgname="dms-shell-plugin-nut-git"
pkgver=r6.d88f68c
pkgrel=1
pkgdesc="UPS monitoring via NUT for DankMaterialShell."
arch=('any')
url="https://github.com/acmagn/DMS-UPS-Monitor"
license=('MIT')
depends=('dms-shell' 'nut')
makedepends=('git')
provides=('dms-shell-plugin-nut')
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
  install -dm755 "${pkgdir}/usr/share/quickshell/dms/PLUGINS/DankUpsMonitor"
  cp -r --no-preserve=ownership ${_name}/* "${pkgdir}/usr/share/quickshell/dms/PLUGINS/DankUpsMonitor"
}
