# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

_pkgname=pipewalker
pkgname=${_pkgname}-git
pkgver=1.1
pkgrel=1
pkgdesc='Puzzle game'
arch=('x86_64')
license=('MIT')
makedepends=(
  'git'
  'meson'
  )
depends=(
  'sdl3'
  )
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/artemsen/pipewalker'
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --always | sed 's/-g.*//;s/^v//;s/-/./'
}

build() {
  local meson_options=(
    -D version=${pkgver}
  )
  arch-meson ${_pkgname} build "${meson_options[@]}"
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${_pkgname}/
}
