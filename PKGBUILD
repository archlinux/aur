# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=dory-git
pkgver=6.7.4.r2646.566c2579
pkgrel=1
pkgdesc="A standalone Nemo fork named Dory for file picking and portal integration (git)"
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
  git
  meson
  gobject-introspection
  intltool
  glib2-devel
  libgsf
)
provides=(dory)
conflicts=(dory)
source=("dory::git+https://github.com/Twilight0/dory.git")
sha256sums=('SKIP')

pkgver() {
  cd dory
  printf "6.7.6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson dory build \
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
