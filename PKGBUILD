# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/hydrapaper

pkgname=hydrapaper-git
pkgver=1.2.r27.g72daf12
pkgrel=1
pkgdesc='A Gtk utility to set two different backgrounds for each monitor on GNOME'
arch=('any')
url='https://github.com/gabmus/hydrapaper'
license=('GPL3')
depends=('gtk3>=3.24' 'python' 'python-pillow' 'libwnck3' 'python-gmconfig' 'python-gmgtk')
makedepends=('git' 'meson')
provides=('hydrapaper')
conflicts=('hydrapaper')
source=("hydrapaper::git+https://github.com/gabmus/hydrapaper")
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
