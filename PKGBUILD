# Maintainer: Stanislaw Grams <sjg@fmdx.pl>

pkgname=meteodata-git
pkgver=20200912
pkgrel=1
pkgdesc="A C++ parser that provides real-time meteo data from pogodynka.pl/IMGW"
arch=('x86_64')
url="https://github.com/sgrams/meteodata"
license=('MIT')
depends=('curl')
provides=('meteodata')
conflicts=('meteodata')
makedepends=('git' 'nlohmann-json' 'cmake' 'ninja' 'pkgconf' 'curl')
source=("git+https://github.com/sgrams/meteodata")
md5sums=('SKIP')
_gitname="meteodata"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build && cd build
  cmake .. -GNinja -Wall -DCMAKE_INSTALL_PREFIX='/usr'
  ninja
}

package() {
  cd "$srcdir/$_gitname/build"
  DESTDIR="$pkgdir" ninja install
}
