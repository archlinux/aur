# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/gabmus/notorious

pkgname=notorious-git
pkgver=0.1.r0.g2f22906
pkgrel=1
pkgdesc='Keyboard centric notes'
arch=('any')
url='https://gitlab.gnome.org/gabmus/notorious'
license=('GPL3')
depends=(
    'gtk3'
    'python'
    'libhandy'
    'python-gobject'
    'gobject-introspection'
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
