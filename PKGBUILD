# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=scenefx0.17-git
pkgver=r235.d1323e6
pkgrel=1
pkgdesc="scenefx 0.17.4"
url="https://github.com/DreamMaoMao/scenefx"
arch=("x86_64")
license=("MIT")
depends=(
  glibc
  'wayland>=1.23.1'
  'libinput>=1.27.1'
  libdrm
  pixman
  libxkbcommon
  wlroots0.17
)

makedepends=(
  git
  meson
  ninja
  'wayland-protocols>=1.41'
)

provides=(scenefx)
conflicts=(scenefx scenefx-git)
source=("$pkgname::git+https://github.com/DreamMaoMao/scenefx.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname
    git checkout 0.17.4
}

build() {  
  export PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig:$PKG_CONFIG_PATH
  arch-meson $pkgname build 
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

