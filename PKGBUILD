# Maintainer: TimWcx <timwcx#qq.com>

_pkgbase=plasma6-applets-plasma-drawer
pkgname=${_pkgbase}-git
pkgver=r136.2edae31
pkgrel=1
pkgdesc="A full-screen customizable launcher with application directories and krunner-like search for KDE Plasma."
arch=(any)
url="https://github.com/P-Connor/plasma-drawer"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git)
source=("${_pkgbase}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgbase}" &&
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgbase}" && make metadata.json
}

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/p-connor.plasma-drawer"
  mkdir -p "$_pkgdir"
  cp -r ${_pkgbase}/contents "$_pkgdir"
  cp -r ${_pkgbase}/metadata.json "$_pkgdir"
}
