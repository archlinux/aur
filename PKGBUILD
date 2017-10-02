# Maintainer: Nathan Osman <nathan@quickmediasolutions.com>

pkgname=esee-git
_pkgname=esee
pkgver=r18.ea1d728
pkgrel=1
pkgdesc="Extremely simple EXIF editor"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/nathan-osman/esee'
depends=('qt5-base' 'libexif')
makedepends=('cmake' 'git')
conflicts=('esee' 'esev' 'esev-git')
provides=('esee')
source=("$pkgname::git+https://github.com/nathan-osman/esee.git")
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
