pkgname=nm-sidebar
pkgver=0.4.2
pkgrel=1
pkgdesc='GTK4/libadwaita NetworkManager sidebar for Wayland desktops'
arch=('x86_64')
url='https://github.com/Relz/network-manager-sidebar'
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gtk4'
  'libadwaita'
  'networkmanager'
  'gtk4-layer-shell'
  'nm-connection-editor'
)
makedepends=(
  'meson'
  'ninja'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69cb23c50109e448cdbc9607d6b1e4fa0794dd7850213882345fb454c63880d6')

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
