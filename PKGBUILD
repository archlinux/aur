# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname='dynamic-wallpaper-editor-git'
_pkgname='dynamic-wallpaper-editor'
pkgver=r278.2b4a336
pkgrel=1
pkgdesc="A little utility for creation or edition of GNOME desktop's XML wallpapers"
changelog='CHANGELOG'
arch=('x86_64')
url="https://github.com/maoschanz/${_pkgname}"
license=('GPL3')
depends=('python' 'hicolor-icon-theme' 'dconf')
makedepends=('git' 'meson' 'itstool')
provides=("${_pkgname%-git}")
conflicts=("${_pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  arch-meson "${_pkgname}" build
  ninja -C build
}

package () {
  DESTDIR="${pkgdir}" ninja -C build install
}
