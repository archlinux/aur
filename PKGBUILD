# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=pango-git
pkgver=1.44.3
pkgrel=1
epoch=1
pkgdesc="A library for layout and rendering of text"
url="https://www.pango.org/"
arch=(x86_64)
license=(LGPL)
provides=(pango)
conflicts=(pango)
depends=(cairo libxft harfbuzz fribidi)
makedepends=(gobject-introspection git meson)
optdepends=("libthai: Thai language support")
#checkdepends=(ttf-dejavu cantarell-fonts)
source=("git+https://gitlab.gnome.org/GNOME/pango.git")
sha256sums=('SKIP')

pkgver() {
  cd pango
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pango
}

build() {
  arch-meson pango build -D gtk_doc=false -D libthai=disabled
  ninja $NINJAFLAGS -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
