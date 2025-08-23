# Maintainer: Carlos Valderrama Montes <carlosvalde9@gmail.com>

pkgname=rofi-reddit
_pkgname=rofi-reddit
pkgver=0.1.1
pkgrel=1
pkgdesc='Browse reddit threads from rofi using the Reddit API'
url='https://github.com/valdebrutal/rofi-reddit'
arch=('x86_64')
license=('unknown')
depends=('rofi' 'curl' 'jansson' 'glibc')
makedepends=('git' 'meson')
options=('!debug')
source=("git+https://github.com/valdebrutal/rofi-reddit.git")
sha256sums=('SKIP')


prepare() {
  cd "${pkgname}"
  git checkout "${pkgver}"
  meson subprojects download tomlc17
}

build() {
  arch-meson "${pkgname}" build -Dtests=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

