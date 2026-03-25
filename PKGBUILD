# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner
pkgver=0.6.6
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
sha256sums=('b2c4bd2e2010c00a4a4e22af59231e66d4107482b7eb3b6ecc6531947e8074a2')

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
