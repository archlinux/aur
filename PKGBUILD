# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_name=dms-ntfy
pkgname="dms-shell-plugin-ntfy-git"
pkgver=r12.34c091c
pkgrel=1
pkgdesc="Persistent ntfy inbox for DankMaterialShell."
arch=('any')
url="https://github.com/arqueon/dms-ntfy"
license=('MIT')
depends=('dms-shell' 'curl' 'libsecret')
makedepends=('git')
provides=('dms-shell-plugin-ntfy')
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
  install -dm755 "${pkgdir}/usr/share/quickshell/dms/PLUGINS/${_name}"
  cp -r --no-preserve=ownership "${_name}"/* "${pkgdir}/usr/share/quickshell/dms/PLUGINS/${_name}"
}
