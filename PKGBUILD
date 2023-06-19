# Maintainer: xiota
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>

_pkgname="sushi"
pkgname="$_pkgname-git"
pkgver=44.2.r6.g169c15d
pkgrel=1
pkgdesc="A quick previewer for Nautilus"
url="https://gitlab.gnome.org/GNOME/sushi"
arch=(x86_64)
license=(GPL2)
depends=(
  'evince'
  'gjs'
  #'gst-plugin-gtk'
  'gst-plugins-base-libs'
  'gtksourceview4'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
)
optdepends=(
  'gst-plugins-bad: Codecs for media support'
  'gst-plugins-good: Codecs for media support'
  'gst-plugins-ugly: Codecs for media support'
  'libreoffice: OpenDocument formats'
)

provides=("$_pkgname")
conflicts=(${provides[@]})

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
