# Maintainer: unixman69 <unixman@tuta.io>

pkgname=gnome-shell-extension-dash-to-dock-multipos
pkgver=105.1
pkgrel=1
pkgdesc="Dash to Dock fork with per-monitor dock position (GNOME Shell extension)"
arch=('any')
url="https://github.com/unixman69/dash-to-dock-multipos"
license=('GPL-2.0-only')
depends=('gnome-shell>=45')
makedepends=('glib2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9935b45f578b22c8898f5168ef38e30a4f7c99191e7e9c6a865eceed50d5bcf')

_uuid=dash-to-dock-multipos@unixman69

build() {
  cd "dash-to-dock-multipos-$pkgver"
  # Both the fork's schema and its copy of the upstream schema are resolved
  # from the extension's own schemas directory, so nothing is installed into
  # /usr/share/glib-2.0/schemas and the package can coexist with
  # gnome-shell-extension-dash-to-dock (enable one or the other, never both).
  glib-compile-schemas schemas/
}

package() {
  cd "dash-to-dock-multipos-$pkgver"

  local dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  install -d "$dest"
  cp -a -- . "$dest"
  rm -rf -- "$dest"/{README.md,.gitignore}

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
