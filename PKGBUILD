# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=libsingularity-git
pkgver=r185.38407a9
pkgrel=1
pkgdesc="GTK4 application and widget framework for the Singularity Desktop Environment"
arch=('x86_64')
url="https://github.com/singularityos-lab/libsingularity"
license=('LGPL-2.1-only')
depends=(
  'gtk4'
  'gtk4-layer-shell'
  'gtksourceview5'
  'json-glib'
  'libgee'
  'libnm'
  'libpulse'
  'libpeas-2'
  'libsoup3'
  'upower'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
  'sassc'
  'vala'
)
provides=(
  "${pkgname%-git}"
  'libsingularity.so=0'
  'libsingularity-system.so=0'
)
conflicts=("${pkgname%-git}")
source=("git+https://github.com/singularityos-lab/libsingularity.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
