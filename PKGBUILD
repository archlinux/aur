# Maintainer: Nathan Osman <nathan@quickmediasolutions.com>

pkgname=esev-git
_pkgname=esev
pkgver=r8.bd1758b
pkgrel=1
pkgdesc="Extremely simple EXIF viewer"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/nathan-osman/esev'
depends=('qt5-base' 'libexif')
makedepends=('cmake' 'git')
conflicts=('esev')
provides=('esev')
source=("$pkgname::git+https://github.com/nathan-osman/esev.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir build
}

build() {
  cd "$srcdir/$pkgname/build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}
