# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=dory
pkgver=6.7.6
pkgrel=1
pkgdesc="A standalone Nemo fork named Dory for file picking and portal integration"
arch=('x86_64')
url="https://github.com/Twilight0/dory"
license=('GPL3')
depends=(
  cinnamon-desktop
  libexif
  exempi
  xapp
  gtk3
)
makedepends=(
  meson
  gobject-introspection
  intltool
  glib2-devel
  libgsf
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/dory/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname-$pkgver" build \
    -Ddeprecated_warnings=false \
    -Dempty_view=false \
    -Dexif=true \
    -Dgtk_doc=false \
    -Dgtk_layer_shell=false \
    -Dselinux=false \
    -Dtracker=false \
    -Dxmp=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
