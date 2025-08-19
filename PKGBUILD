# Maintainer: valdebrutal <carlosvalde9@gmail.com>

pkgname=rofi-reddit
_pkgname=rofi-reddit
pkgver=0.1.0 # This will be updated automatically by the pkgver() function
pkgrel=1
pkgdesc='Browse reddit threads from rofi using the Reddit API'
url='https://github.com/valdebrutal/rofi-reddit'
arch=('x86_64')
license=('unknown')
depends=('rofi' 'curl')
makedepends=('git' 'meson')
source=("git+https://github.com/valdebrutal/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git fetch --tags >/dev/null 2>&1
  git describe --tags --abbrev=0 | sed 's/^v//'
}

prepare() {
  cd "${_pkgname}"
  git checkout "$(git describe --tags --abbrev=0)"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
