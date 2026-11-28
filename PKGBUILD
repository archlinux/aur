# Maintainer: BlackCherry <blackcherry at danwin1210 dot de>

pkgname=mangowm-wlonly
stablecommit=3d8177f550b66500e74c849171b935c72af0935f
pkgver='0.19.4'
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
  libglvnd
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
