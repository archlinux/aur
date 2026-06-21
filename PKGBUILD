pkgname=bm-sidebar
pkgver=0.1.0
pkgrel=1
pkgdesc='GTK4/libadwaita Bluetooth sidebar for Wayland desktops'
arch=('x86_64')
url='https://github.com/Relz/bluetooth-manager-sidebar'
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gtk4'
  'libadwaita'
  'json-glib'
  'gtk4-layer-shell'
  'bluez'
  'bluez-utils'
  'libpulse'
  'util-linux'
)
makedepends=(
  'meson'
  'ninja'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2be7d72f54e0b81171d47eb71aa27b2f719fdf64933e466c475db84c5e6599ae')

_github_repo='Relz/bluetooth-manager-sidebar'
_source_name="${_github_repo##*/}-$pkgver"
_build_name="build-$pkgver-$pkgrel"

build() {
  local source_dir="$srcdir/$_source_name"
  local build_dir="$srcdir/$_build_name"

  rm -rf "$build_dir"
  meson setup "$build_dir" "$source_dir" \
    --prefix=/usr \
    --libdir=lib \
    --libexecdir=libexec \
    --buildtype=plain
  meson compile -C "$build_dir"
}

package() {
  local build_dir="$srcdir/$_build_name"

  DESTDIR="$pkgdir" meson install -C "$build_dir"
}
