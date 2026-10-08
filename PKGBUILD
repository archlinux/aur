pkgname=nm-sidebar
pkgver=1.2.0
pkgrel=1
pkgdesc='GTK4/libadwaita NetworkManager sidebar for Wayland desktops'
arch=('x86_64')
url='https://github.com/Relz/network-manager-sidebar'
license=('GPL-3.0-or-later')
keywords=('gtk4' 'layer-shell' 'libadwaita' 'network-manager' 'networkmanager' 'sidebar' 'vpn' 'wayland' 'wifi')
depends=(
  'glib2>=2.68'
  'json-glib>=1.6'
  'gtk4'
  'libadwaita>=1.6'
  'networkmanager'
  'gtk4-layer-shell'
  'nm-connection-editor'
  'polkit'
  'dbus'
)
makedepends=(
  'meson'
  'ninja'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cc4af29e93a3c4a04a8ec318a08c2fee2b1644b6a4574b34f2fb8d9bac124aa6')

_github_repo='Relz/network-manager-sidebar'
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
