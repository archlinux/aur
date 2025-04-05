# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=maomaowm-round
pkgver=r236.bb2e81e
pkgrel=1
pkgdesc="A Wayland compositor with smooth animation(with round corner)"
url="https://github.com/DreamMaoMao/maomaowm"
arch=("x86_64")
license=("MIT")
depends=(
  glibc
  'wayland>=1.23.1'
  'libinput>=1.27.1'
  libdrm
  pixman
  libxkbcommon
  scenefx0.17-git
  wlroots0.17
)

makedepends=(
  git
  meson
  ninja
  'wayland-protocols>=1.41'
)

provides=(maomaowm wayland-compositor)
conflicts=(maomaowm-git maomaowm)
source=("$pkgname::git+https://github.com/DreamMaoMao/maomaowm.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname
    git checkout corner_radius
}

build() {  
  export PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig:$PKG_CONFIG_PATH
  arch-meson $pkgname build 
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

