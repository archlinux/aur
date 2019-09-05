# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://gitlab.com/gabmus/gnome-feeds

pkgname=gfeeds-git
pkgver=0.9.r1.gad60a35
pkgrel=1
pkgdesc='News reader for GNOME'
arch=('any')
url='https://gitlab.com/gabmus/gnome-feeds'
license=('GPL3')
depends=('gtk3' 'python' 'python-pytz' 'python-dateutil' 'python-pillow' 'libhandy' 'python-listparser' 'python-feedparser' 'python-requests' 'python-lxml' 'webkit2gtk' 'python-html5lib' 'python-gobject' 'gobject-introspection')
replaces=(gnome-feeds gnome-feeds-git)
makedepends=('git' 'meson')
provides=('gfeeds' 'gnome-feeds')
conflicts=('gnome-feeds' 'gnome-feeds-git' 'gfeeds')
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
