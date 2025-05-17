# Maintainer: Craig <fast dot code dot studio at gmail dot com>

pkgname=aweather-git
provides=('aweather')
pkgver=0.9.0.r20
pkgrel=1
pkgdesc="Free real-time weather data viewer designed for weather enthusiasts."
arch=('aarch64' 'x86_64')
url="http://pileus.org/aweather/"
license=('GPL3')
makedepends=('asciidoc' 'icoutils')
depends=("grits" 'mesa' 'rsl')
optdepends=('gpsd')
source=('git+https://github.com/i3Craig/aweather.git')
sha512sums=('SKIP')

# Generate a version number based on the number of commits to the default branch.
pkgver() {
  cd aweather
  printf "0.9.0.r%s" "$(git rev-list --count HEAD)"
}

prepare() {
  cd aweather
   ./configure --prefix=/usr LIBS=-lgthread-2.0
}

build() {
  cd aweather
  make
}

package() {
  cd aweather
  make DESTDIR="${pkgdir}" install
}
