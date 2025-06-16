# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=maomaowm-git
pkgver=r517.6b2ef05
pkgrel=3.1
pkgdesc="A Wayland compositor with smooth animation"
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
  pcre2
  'wlroots-0.19-mao-git'
)

makedepends=(
  git
  meson
  ninja
  fakeroot
  debugedit
  base-devel
  'wayland-protocols>=1.41'
)

provides=(maomaowm wayland-compositor)
conflicts=(maomaowm maomaowm-git maomaowm-next-git)
source=("$pkgname::git+https://github.com/DreamMaoMao/maomaowm.git")
md5sums=('SKIP')


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

