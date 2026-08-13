# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=mangobar-git
pkgver=r2.667745d
pkgrel=1.3
pkgdesc="A simple bar for mango wayland compositor"
url="https://github.com/mangowm/mangobar"
arch=("x86_64")
license=("GPL-3.0")
depends=(
  alsa-lib
  cairo
  cjson
  fcft
  gdk-pixbuf2
  libpulse
  pango
  pixman
  systemd-libs
  wayland
)

makedepends=(
  git
  meson
  ninja
  'wayland-protocols>=1.41'
)

provides=(mangobar)
conflicts=(mangobar)
source=("$pkgname::git+https://github.com/mangowm/mangobar.git")
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
  export CC="gcc"
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
