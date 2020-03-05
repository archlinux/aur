# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/jwestman/libaperture

pkgname=libaperture-git
pkgver=10f7a18
pkgrel=1
pkgdesc='A camera library for GTK3'
arch=('any')
url='https://gitlab.gnome.org/jwestman/libaperture'
license=('GPL3')
depends=(
    'vala'
    'gtk3'
    'gobject-introspection'
)
makedepends=('git' 'meson')
provides=('libaperture')
conflicts=('libaperture')
source=("libaperture::git+https://gitlab.gnome.org/jwestman/libaperture")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/libaperture"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/libaperture"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --buildtype release ..
  ninja
}

package() {
  cd "$srcdir/libaperture"
  cd build
  DESTDIR="$pkgdir" ninja install
}
