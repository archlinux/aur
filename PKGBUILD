# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://gitlab.com/gabmus/gnome-feeds

pkgname=gnome-feeds-git
pkgver=0.7.r1.gae32fdf
pkgrel=1
pkgdesc='News reader for GNOME'
arch=('any')
url='https://gitlab.com/gabmus/gnome-feeds'
license=('GPL3')
depends=('gtk3' 'python' 'python-pytz' 'python-dateutil' 'python-pillow' 'libhandy' 'python-listparser' 'python-feedparser' 'python-requests' 'python-lxml' 'webkit2gtk' 'python-html5lib' 'python-gobject' 'gobject-introspection')
makedepends=('git' 'meson')
provides=('gnome-feeds')
conflicts=('gnome-feeds')
source=("gfeeds::git+https://gitlab.com/gabmus/gnome-feeds")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gfeeds"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gfeeds"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --buildtype release ..
  ninja
}

package() {
  cd "$srcdir/gfeeds"
  cd build
  DESTDIR="$pkgdir" ninja install
}
