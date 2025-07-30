# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=mango-git
pkgver=r726.575e5d4
pkgrel=1
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mango"
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
  'wlroots-0.19-mao-git'
  'scenefx-git'
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

provides=(mango wayland-compositor)
conflicts=(mango mango-git mango-next-git)
source=("$pkgname::git+https://github.com/DreamMaoMao/mango.git")
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

