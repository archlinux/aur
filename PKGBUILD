# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_name=dux-plugins
pkgname="dux-shell-plugins-git"
pkgver=r129.a55bb40
pkgrel=1
pkgdesc="First party plugins for Dux Shell."
arch=('any')
url="https://github.com/duxlabs-dev/dux-plugins"
license=('MIT')
depends=('dux-shell')
makedepends=('git')
provides=('dux-shell-plugins')
replaces=('dms-shell-plugins-git')
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

prepare() {
  cd "${_name}"
  rm .gitignore LICENSE
  mv README.md $_name.md
}

package() {
  install -d -m 755 "${pkgdir}/usr/share/quickshell/dux-shell/plugins"
  cp -rdp --no-preserve=ownership dux-plugins/* "${pkgdir}/usr/share/quickshell/dux-shell/plugins"
}
