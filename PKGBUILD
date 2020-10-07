# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/gabmus/notorious

pkgname=notorious-git
pkgver=0.4.r0.g2483044
pkgrel=2
pkgdesc='Keyboard centric notes'
arch=('any')
url='https://gitlab.gnome.org/gabmus/notorious'
license=('GPL3')
depends=(
    'gtk3'
    'python'
    'libhandy>=0.83'
    'python-gobject'
    'gobject-introspection'
    'gtksourceview4'
)
makedepends=('git' 'meson')
provides=('notorious')
conflicts=('notorious')
source=("notorious::git+https://gitlab.gnome.org/gabmus/notorious")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/notorious"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/notorious"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --buildtype release ..
  ninja
}

package() {
  cd "$srcdir/notorious"
  cd build
  DESTDIR="$pkgdir" ninja install
}
