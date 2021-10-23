# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=eve
_author=jfalcou

pkgname=${_name}-git
pkgver=v2021.10.0.r0.gaeb09001c
pkgrel=1
pkgdesc="Expressive Velocity Engine - SIMD in C++ Goes Brrrr"
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('MIT')

depends=()
makedepends=('cmake' 'make')
provides=('eve')
conflicts=('eve')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
