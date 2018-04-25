# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=gr-limesdr-git
pkgver=r5.2130f1e
pkgrel=1
pkgdesc="gr-limesdr Plugin for GNURadio"
arch=(any)
url="https://github.com/myriadrf/gr-limesdr"
license=('MIT')
depends=('boost' 'gnuradio' 'swig' 'limesuite')
makedepends=('git')
provides=('gr-limesdr')
conflicts=('gr-limesdr')
source=('remote::git+https://github.com/myriadrf/gr-limesdr')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/remote"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/remote/build"
  cd "$srcdir/remote/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/remote/build"

  make DESTDIR="$pkgdir" install
}
