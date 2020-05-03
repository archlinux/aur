# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/gabmus/whatip

pkgname=whatip-git
pkgver=0.1.2.r0.g008b2d8
pkgrel=1
pkgdesc='Info on your IP'
arch=('any')
url='https://gitlab.gnome.org/gabmus/whatip'
license=('GPL3')
depends=(
    'gtk3'
    'python'
    'libhandy'
    'python-requests'
    'python-netaddr'
    'iproute2'
    'python-gobject'
    'gobject-introspection'
)
makedepends=('git' 'meson')
provides=('whatip')
conflicts=('whatip')
source=("whatip::git+https://gitlab.gnome.org/gabmus/whatip")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/whatip"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/whatip"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --buildtype release ..
  ninja
}

package() {
  cd "$srcdir/whatip"
  cd build
  DESTDIR="$pkgdir" ninja install
}
