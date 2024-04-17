# Maintainer:
# Contributor: Tomoghno Sen <tomoghno@outlook.com>

_pkgname="fondo"
pkgname="$_pkgname"
pkgver=1.6.1
pkgrel=4
pkgdesc='Wallpaper App for Linux'
url="https://github.com/calo001/fondo"
license=('AGPL-3.0-or-later')
arch=('x86_64')

depends=(
  'elementary-icon-theme'
  'granite'
  'gtk-theme-elementary'
  'json-glib'
  'libhandy'
  'libsoup'

  ## implicit
  #dconf
  #glib2
  #gtk3
  #hicolor-icon-theme
  #libgee
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

prepare() {
  cd "$_pkgname"
  patch -p1 -i "../elementary-theme.patch"
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
