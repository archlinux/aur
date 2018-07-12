# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=lime-tools-git
_pkgname=${pkgname%-git}
pkgver=r11.1ff87a6
pkgrel=1
pkgdesc="A collection of useful tools for use with the LimeSDR family of boards"
arch=('any')
url="https://github.com/myriadrf/lime-tools"
license=('Apache')
depends=('limesuite' 'gnuplot' 'fftw>=3')
makedepends=('cmake')
provides=('lime-tools')
conflicts=('lime-tools')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir"/$_pkgname/build
  cd "$srcdir"/$_pkgname/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$_pkgname/build

  make DESTDIR="$pkgdir" install
}
