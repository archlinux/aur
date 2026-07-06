pkgname=bm-sidebar
pkgver=0.2.0
pkgrel=1
pkgdesc='GTK4/libadwaita Bluetooth sidebar for Wayland desktops'
arch=('x86_64')
url='https://github.com/Relz/bluetooth-manager-sidebar'
license=('GPL-3.0-or-later')
keywords=('bluetooth' 'bluetooth-manager' 'bluez' 'wayland' 'layer-shell' 'sidebar' 'gtk4' 'libadwaita' 'obex' 'file-transfer')
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
sha256sums=('ff9ec9daadcd29a1c5ace23ad36bfc7b4051298579e7802d6ebaeedbfb6965c5')

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
