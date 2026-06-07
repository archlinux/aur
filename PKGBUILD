pkgname=nm-sidebar
pkgver=0.4.1
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
sha256sums=('a59d2ed69315a2c2fead4786b9ab1a3ef2ce11a1a7e5e3912f6e1ec0cda56c38')

_github_repo='Relz/network-manager-sidebar'
_source_dir="$srcdir/${_github_repo##*/}-$pkgver"
_build_dir="$srcdir/build-$pkgver-$pkgrel"

build() {
  rm -rf "$_build_dir"
  meson setup "$_build_dir" "$_source_dir" \
    --prefix=/usr \
    --libdir=lib \
    --libexecdir=libexec \
    --buildtype=plain
  meson compile -C "$_build_dir"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$_build_dir"
}
