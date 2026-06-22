# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_name=dms-plugins
pkgname="dms-shell-plugins-git"
pkgver=r102.f458344
pkgrel=1
pkgdesc="First party plugins for DankMaterialShell."
arch=('any')
url="https://github.com/AvengeMedia/dms-plugins"
license=('MIT')
depends=('dms-shell')
makedepends=('git')
provides=('dms-shell-plugins')
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

prepare() {
  cd "${_name}"
  rm .gitignore LICENSE
  mv README.md README-$_name.md
}

package() {
  install -d -m 755 "${pkgdir}/usr/share/quickshell/dms/PLUGINS"
  cp -rdp --no-preserve=ownership dms-plugins/* "${pkgdir}/usr/share/quickshell/dms/PLUGINS"
}
