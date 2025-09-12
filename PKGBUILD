# Maintainer: Carlos Valderrama Montes <carlosvalde9@gmail.com>

pkgname=rofi-reddit
_pkgname=rofi-reddit
pkgver=0.1.2
pkgrel=1
pkgdesc='Browse reddit threads from rofi using the Reddit API'
url='https://github.com/valdebrutal/rofi-reddit'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('rofi' 'curl' 'jansson' 'glibc')
makedepends=('git' 'meson')
options=('!debug')
source=("git+https://github.com/valdebrutal/rofi-reddit.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git fetch --tags >/dev/null 2>&1
  git describe --tags --abbrev=0
}

prepare() {
  cd "${pkgname}"
  meson subprojects download tomlc17
}

build() {
  meson setup "${pkgname}" build -Dtests=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

