# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Bill Sideris <bill88t@feline.gr>
pkgname=extension-manager
pkgver=0.6.4
pkgrel=1
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'json-glib'
  'libadwaita'
  'libsoup3'
  'libxml2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
)
source=("git+https://github.com/mjakeman/$pkgname.git#tag=v$pkgver")
sha256sums=('a8c9fa24f005d670ee6676015c3069a311295490791621b45a4a68c7e0fd33c3')

build() {
  arch-meson "$pkgname" build -Dbacktrace=false
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
