# Maintainer: evgvs <evgvs@t.me>

pkgname=bigclick
pkgver=46.0_bigclick
pkgrel=1
pkgdesc="Patched kgx (GNOME Console): right-click to copy/paste (as in Windows)"
url="https://github.com/evgvs/bigclick"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  dconf
  gcc-libs
  gtk4
  glib2
  glibc
  hicolor-icon-theme
  libadwaita
  libgtop
  pango
  vte4
)
makedepends=(
  appstream
  git
  meson
  python-packaging
)
groups=(gnome)
conflicts=("gnome-console")
provides=("gnome-console")
source=("git+https://github.com/evgvs/bigclick")
md5sums=("SKIP")

prepare() {
  cd $pkgname
}

build() {
  local meson_options=(
    -D tests=true
  )

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
