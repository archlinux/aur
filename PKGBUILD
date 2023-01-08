# Maintainer: Stanislaw Grams <sjg@fmdx.pl>

pkgname=overlayaz-git
pkgver=20230108
pkgrel=1
pkgdesc="Photo visibility analysis software"
arch=('x86_64')
url="https://github.com/kkonradpl/overlayaz"
license=('GPL2')
depends=('curl' 'json-c' 'gtk3' 'osm-gps-map' 'sqlite3' 'libgexiv2')
provides=('overlayaz')
conflicts=('overlayaz')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'json-c' 'gtk3' 'osm-gps-map' 'sqlite3' 'cmocka')
source=("git+https://github.com/kkonradpl/overlayaz")
md5sums=('SKIP')
_gitname="overlayaz"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname/build"
  cmake .. -GNinja -Wall -DCMAKE_INSTALL_PREFIX='/usr'
  ninja
}

package() {
  cd "$srcdir/$_gitname/build"
  DESTDIR="$pkgdir" ninja install
}
