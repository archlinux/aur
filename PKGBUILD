# Maintainer: xiota / aur.chaotic.cx
# Contributor: Tomoghno Sen <tomoghno@outlook.com>

_pkgname="fondo"
pkgname='fondo'
pkgver=1.6.1
pkgrel=3
pkgdesc='Wallpaper App for Linux'
arch=('x86_64')
url="https://github.com/calo001/fondo"
license=('GPL3')
depends=(
  'elementary-icon-theme'
  'granite'
  'gtk-theme-elementary'
  'json-glib'
  'libhandy'
  'libsoup'
)
makedepends=(
  'git'
  'meson'
  'vala'
)

source=(
  "$_pkgname"::"git+$url.git#tag=$pkgver"
  "elementary-theme.patch"
)
sha256sums=(
  'SKIP'
  'e2204425522f276d7604f7a3b6471d85cc8d11ede2b2d6b12d66a254f581ec9b'
)

prepare () {
  cd "$_pkgname"
  patch -p1 -i "$srcdir/elementary-theme.patch"
}

build () {
  arch-meson "$_pkgname" build
  ninja -C build
}

package () {
  DESTDIR="$pkgdir" ninja -C build install
}
