# Contributor: Matthieu Valleton <see@seos.fr>

pkgname=tempered-git
pkgver=r100.e77ee06
pkgrel=1
pkgdesc="Library and utilities to read data from some HID TEMPer USB temperature and humidity sensors"
arch=('i686' 'x86_64')
url="https://github.com/edorfaus/TEMPered"
depends=('hidapi')
makedepends=('git' 'cmake' 'hidapi')
provides=('tempered')
license=('custom')
md5sums=('SKIP')

source=('tempered-git::git+https://github.com/edorfaus/TEMPered')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  msg "Starting cmake..."

  cmake "../${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir/" install
}

