# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/gabmus/hydrapaper

pkgname=hydrapaper-git
pkgver=2.0.1.r3.gc141b39
pkgrel=1
pkgdesc='Wallpaper manager with multimonitor support'
arch=('any')
url='https://gitlab.gnome.org/gabmus/hydrapaper'
license=('GPL3')
depends=(
  'gtk3'
  'python'
  'python-pillow'
  'libhandy>=0.83'
  'gobject-introspection'
  'python-gobject'
)
makedepends=('git' 'meson')
provides=('hydrapaper')
conflicts=('hydrapaper')
source=("hydrapaper::git+https://gitlab.gnome.org/gabmus/hydrapaper")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hydrapaper"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/hydrapaper"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --buildtype release ..
  ninja
}

package() {
  cd "$srcdir/hydrapaper"
  cd build
  DESTDIR="$pkgdir" ninja install
}
