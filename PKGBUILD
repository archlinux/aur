# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=sov-git
_gitname=${pkgname%-git}
pkgver=0.94.r9.g1bcf5fa
pkgrel=1

pkgdesc="An overlay that shows schemas for all workspaces to make navigation in sway easier"
url="https://github.com/milgra/sov"
license=(GPL-3.0-only)
arch=(x86_64)

depends=(
  freetype2
  glew
  glibc
  libegl
  libgl
  libpng
  libxkbcommon
  wayland
)
makedepends=(
  git
  meson
  wayland-protocols
)

provides=("sov=$pkgver")
conflicts=(sov)

source=("git+$url.git#branch=main")
b2sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup --prefix=/usr --buildtype=plain "$_gitname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
