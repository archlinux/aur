# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=kumi
_author=jfalcou

pkgname=${_name}-git
pkgver=v3.0.r31.gea96213
pkgrel=1
pkgdesc="C++20 Compact Tuple Tools"
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('Boost')

depends=()
makedepends=('git' 'cmake' 'make')
provides=('kumi')
conflicts=('kumi')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags --match 'v*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
