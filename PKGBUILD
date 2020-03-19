# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.com/gabmus/gnome-feeds

pkgname=gfeeds-git
pkgver=0.13.2.r0.g14d34e8
pkgrel=1
pkgdesc='News reader for GNOME'
arch=('any')
url='https://gitlab.com/gabmus/gnome-feeds'
license=('GPL3')
depends=(
    'gtk3'
    'python'
    'python-pytz'
    'python-dateutil'
    'python-pillow'
    'libhandy'
    'python-listparser'
    'python-feedparser'
    'python-requests'
    'python-lxml'
    'webkit2gtk'
    'python-html5lib'
    'python-gobject'
    'gobject-introspection'
    'python-readability-lxml'
    'python-pygments'
    'python-beautifulsoup4'
)
replaces=(gnome-feeds gnome-feeds-git)
makedepends=('git' 'meson')
provides=('gfeeds' 'gnome-feeds')
conflicts=('gnome-feeds' 'gnome-feeds-git' 'gfeeds')
source=("gfeeds::git+https://gitlab.gnome.org/World/gfeeds")
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
