# Maintainer: redtide <redtid3@gmail.com>

_pkgname=midibench
pkgname=$_pkgname-git
pkgver=17.d9bf151
pkgrel=1
pkgdesc="MIDI tool for developers"
url=https://github.com/jpcima/midibench
arch=(x86_64)
license=(Boost)
depends=(
  glew
  rtmidi
  sdl2
  sdl_image
)
makedepends=(
  git
  meson
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha512sums=(SKIP)
pkgver() {
  cd "$srcdir"/$_pkgname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$srcdir"/$_pkgname
  git submodule update --init --recursive
}
build() {
  cd "$srcdir"/$_pkgname
  meson setup --prefix /usr --buildtype=plain build
  meson compile -C build
}
package() {
  cd "$srcdir"/$_pkgname
  DESTDIR="$pkgdir" meson install -C build
  install -vDm 644 "$srcdir"/$_pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname/
}
