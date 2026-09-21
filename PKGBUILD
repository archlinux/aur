# Maintainer: kotontrion <kotontrion@kotontrion.net>

pkgname=libastal-wl4-git
_pkgname=wl4
pkgver=r983.7c3371c
pkgrel=2
provides=(libastal-wl4 libastal-wl4.so=0-64)
pkgdesc="A thin util lib to match GTK4 objects to AstalWl ones"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
  libastal-wl
  gtk4
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
  wl-vapi-gen
)
groups=("libastal")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd astal
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd astal/lib/wl/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/wl/$_pkgname
  meson install -C build --destdir "$pkgdir"
}
