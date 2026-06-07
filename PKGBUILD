pkgname=nm-sidebar
pkgver=0.1.0
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
  'network-manager-applet'
)
makedepends=(
  'meson'
  'ninja'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64eda0ea3beb769272bdef1e42edba08ab24f93d07525a84ea4da39d04f2e93e')

_github_repo='Relz/network-manager-sidebar'
_source_dir="${_github_repo##*/}-$pkgver"

build() {
  meson setup build "$_source_dir" \
    --prefix=/usr \
    --libdir=lib \
    --libexecdir=libexec \
    --buildtype=plain
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
