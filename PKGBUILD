# Maintainer: shadwoash8 <shadowash8 at protonmail dot com>

pkgname=nauka-git

pkgver=r100.35ba52d
pkgrel=1
pkgdesc="a minimal wayland compositor with various layouts, animations and all the eye-candy"
arch=('x86_64')
url="https://github.com/shadowash8/nauka"
license=('GPLV3')
depends=(
  'wayland'
  'libinput'
  'libdrm'
  'pixman'
  'libxkbcommon'
  'wlroots0.20'
  'scenefx=0.5'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'wayland-protocols'
)
provides=('nauka' 'wayland-compositor')
conflicts=('nauka' 'nauka-debug')
source=("${pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "${srcdir}/${pkgname}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
