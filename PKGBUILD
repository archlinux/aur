# Maintainer: Jose Angel Soler Ortiz <jose.angel.soler.ortiz at gmail dot com>
# Contributor: Balazs Nemeth <b2nemeth at gmail dot com>

pkgname=trng4-git
pkgver=v4.24.r3.g589bdf2
pkgrel=1
pkgdesc='A modern C++ pseudo random number generator library'
arch=('any')
url='https://github.com/rabauke/trng4'
license=('BSD')
makedepends=('git' 'cmake>=3.10.0')
checkdepends=('boost-libs')
conflicts=('trng4')
provides=('trng4')
source=('git+https://github.com/rabauke/trng4')
sha512sums=('SKIP')

pkgver() {
  cd trng4
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cmake -B "trng4/build" -S "trng4"        \
        -DCMAKE_BUILD_TYPE:STRING='None'   \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
  make -C "trng4/build" trng4_shared test_all
}

check() {
  make -C "trng4/build" test
}

package() {
  make -C "trng4/build" DESTDIR="$pkgdir" install
  install -Dm644 trng4/COPYING ${pkgdir}/usr/share/licenses/trng4/COPYING
}
