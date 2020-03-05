# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/jwestman/gnome-camera

pkgname=gnome-camera-git
pkgver=193513a
pkgrel=1
pkgdesc='A candidate for the proposed GNOME Camera app'
arch=('any')
url='https://gitlab.gnome.org/jwestman/gnome-camera'
license=('GPL3')
depends=(
    'vala'
    'gtk3'
    'gobject-introspection'
)
makedepends=('git' 'meson')
provides=('gnome-camera')
conflicts=('gnome-camera')
source=("gnome-camera::git+https://gitlab.gnome.org/jwestman/gnome-camera")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gnome-camera"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gnome-camera"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --buildtype release ..
  ninja
}

package() {
  cd "$srcdir/gnome-camera"
  cd build
  DESTDIR="$pkgdir" ninja install
}
