# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mirco Tischler <mt-ml@gmx.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=appstream-glib-git
pkgver=0.7.18.r40.gb6cb98e
pkgrel=1
pkgdesc="Objects and methods for reading and writing AppStream metadata"
url="https://people.freedesktop.org/~hughsient/appstream-glib/"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 libyaml pacman gcab libsoup libstemmer)
makedepends=(gobject-introspection gtk-doc git gperf meson)
provides=(appstream-glib libappstream-glib.so)
conflicts=(appstream-glib)
source=("git+https://github.com/hughsie/appstream-glib.git")
sha256sums=('SKIP')

pkgver() {
  cd "appstream-glib"
  git describe --always| sed 's|^appstream_glib_||;s|\([^-].\)-|\1-r|;s|[-_]|\.|g'
}

build() {
  arch-meson appstream-glib build \
    -D alpm=true \
    -D gtk-doc=true \
    -D rpm=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
