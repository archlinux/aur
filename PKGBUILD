# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-notifd-git
_pkgname=notifd
pkgver=r16.17a57b9
pkgrel=1
provides=(astal-notifd libastal-notifd libastal-notifd.so=0-64)
pkgdesc="A notification daemon library and cli tool "
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/notifd"
depends=(
  glib2
  json-glib
  gdk-pixbuf2
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
)
groups=("libastal")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $_pkgname
  meson install -C build --destdir "$pkgdir"
}

