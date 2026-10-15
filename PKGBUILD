# Maintainer: BlackCherry <blackcherry at danwin1210 dot de>

pkgname=mangowm-wlonly
stablecommit=4b0287b6b081381806bfafd45adeaf86e456d275
pkgver=0.18.1
pkgrel=1
pkgdesc="mangowm without scenefx"
url="https://github.com/mangowm/mango/tree/wl-only"
arch=("x86_64" "aarch64")
license=("GPL-3.0")
depends=(
  glibc
  'wayland>=1.23.1'
  'libinput>=1.27.1'
  libdrm
  pixman
  libxkbcommon
  pcre2
  pango
  cjson
  libxcb
  xorg-xwayland
  'libwlroots-0.20.so'
)

makedepends=(
  git
  meson
  ninja
  'wayland-protocols>=1.41'
)

provides=(mangowm wayland-compositor)
conflicts=(mangowm mangowm-git)
source=("$pkgname::git+https://github.com/mangowm/mango.git#commit=$stablecommit")
md5sums=('SKIP')

build() {
  arch-meson --wipe $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
