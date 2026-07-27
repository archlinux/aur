# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=mangowm-git
pkgver=1b6e01d7
pkgrel=1.6
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/mangowm/mango"
arch=("x86_64")
license=("GPL-3.0")
depends=(
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
  'scenefx0.5'
)

makedepends=(
  git
  meson
  ninja
  'wayland-protocols>=1.41'
)

provides=(mangowm wayland-compositor)
conflicts=(mangowm mangowm-wlonly-git mangowc mangowc-git mangowc-wllonly-git)
source=("$pkgname::git+https://github.com/mangowm/mango.git")
md5sums=('SKIP')
options=('!strip' '!lto')


pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'}
}

prepare() {
    cd $pkgname
}

build() {
  export CC="gcc"
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

