# Maintainer: shadwoash8 <shadowash8 at protonmail dot com>

pkgname=ashwc-git

pkgver=r311.a2f06f9
pkgrel=1
pkgdesc="a minimal wayland compositor with various layouts, animations and all the eye-candy"
arch=('x86_64')
url="https://github.com/shadowash8/ashwc"
license=('MIT')
depends=(
  'wayland'
  'libinput'
  'libdrm'
  'pixman'
  'libxkbcommon'
  'wlroots0.20'
  'scenefx0.5'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'wayland-protocols'
)
provides=('ashwc' 'wayland-compositor')
conflicts=('ashwc')
source=("${pkgname}::git+https://github.com/shadowash8/ashwc.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # arch-meson sets up the correct Arch compiler flags and installs to /usr instead of /usr/local
  arch-meson "${srcdir}/${pkgname}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
