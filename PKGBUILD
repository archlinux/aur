# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=mangowm-wlonly-git
pkgver=d8d0b173
pkgrel=1.3
pkgdesc="mangowm without scenefx"
url="https://github.com/mangowm/mango/tree/wl-only"
arch=("x86_64")
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
source=("$pkgname::git+https://github.com/mangowm/mango.git#branch=wl-only")
md5sums=('SKIP')
md5sums=('SKIP')
options=('!strip' '!lto')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname
}

build() {  
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

