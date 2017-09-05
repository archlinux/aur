# Maintainer: Ricardo Liang <ricardoliang at gmail dot com>
pkgname=gnome-shell-extension-task-icons-git
pkgver=r23.0e3a429
pkgrel=1
pkgdesc='Adds task icons grouped by workspace to the panel.'
arch=('any')
url="https://github.com/rliang/gnome-shell-extension-task-icons"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
optdepends=()
conflicts=('gnome-shell-extension-task-icons')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${pkgname}"

  local _extname="$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)"

  install -Dm644 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_extname}" *.js *.json gschemas.compiled
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
