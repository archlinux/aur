# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner
pkgver=0.7.2
pkgrel=1
pkgdesc="Extensible control center for GNOME"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/tuner"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libgee'
  'libpeas-2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'gobject-introspection'
  'meson'
  'vala'
)
optdepends=(
  'gnome-tuner-gdm: GNOME Display Manager settings'
  'gnome-tuner-glts: GNOME Legacy Theme Switcher config settings'
  'gnome-tuner-os-info: System information and diagnostics'
  'gnome-tuner-panel: Panel mode switcher'
  'gnome-tuner-tweaks: Extra GNOME settings'
)
provides=('libtuner-1.so')
source=("git+https://altlinux.space/alt-gnome/tuner.git#tag=$pkgver")
sha256sums=('32e58e49b497ed27fb331115b79eaa212abfc30bd87b05f79fd3f90111103bd4')

build() {
  arch-meson tuner build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
