# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=eve
_author=jfalcou

pkgname=${_name}-git
pkgver=2023.02.15.r112.gcf4ab5a8da
pkgrel=1
pkgdesc="Expressive Velocity Engine - SIMD in C++ Goes Brrrr"
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('Boost')

depends=()
makedepends=('git' 'cmake' 'make')
provides=('eve')
conflicts=('eve')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long --match 'v*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

prepare() {
  cmake -B build -S ${pkgname} \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
}

package() {
  make -C build DESTDIR=$pkgdir install
}
