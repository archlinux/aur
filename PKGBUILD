# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://gitlab.com/gabmus/hydrapaper

pkgname=hydrapaper-git
pkgver=1.12.r0.g75282bc
pkgrel=1
pkgdesc='Wallpaper manager with multimonitor support for GNOME'
arch=('any')
url='https://gitlab.com/gabmus/hydrapaper'
license=('GPL3')
depends=(
  'gtk3'
  'python'
  'python-pillow'
  'libwnck3'
  'libhandy1>=0.83'
  'gobject-introspection'
  'python-gobject'
)
makedepends=('git' 'meson')
provides=('hydrapaper')
conflicts=('hydrapaper')
source=("hydrapaper::git+https://gitlab.com/gabmus/hydrapaper")
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
