# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Bill Sideris <bill88t@feline.gr>
pkgname=extension-manager
pkgver=0.6.3
pkgrel=4
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
sha256sums=('2483b26fbbc947bae36a81cbcc2f0440ea340dd5b85c52fe2c6dfd82a1f0c5e6')

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
