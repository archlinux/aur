# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=ddc-controls-git
_pkgname=ddc-controls
pkgver=0.1.0_r2_g52d7bbf
pkgrel=1
pkgdesc='GTK3 monitor control panel for DDC/CI (libddcci) and backlights, with a waybar module (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/ddc-controls'
license=('GPL-3.0-or-later')
depends=(
  'atkmm'
  'glib2'
  'glibc'
  'glibmm'
  'gtkmm3'
  'libddcci'
  'libgcc'
  'libsigc++'
  'libstdc++'
)
makedepends=('git' 'meson')
optdepends=(
  'brightnessctl: control backlight panels without DDC/CI'
  'i2c-tools: i2c group and /dev/i2c-* permissions for DDC/CI'
  'waybar: status bar module (ddc-controls waybar)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
