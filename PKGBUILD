# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=tl-optional
_author=TartanLlama

pkgname=${_name}-git
pkgver=1.1.0.r0.g3a1209d
pkgrel=1
pkgdesc="C++11/14/17 std::optional with functional-style extensions and reference support "
arch=('any')
url="https://github.com/${_author}/optional"
license=('CC0')

depends=()
makedepends=('cmake')
provides=('tl-optional')
conflicts=('tl-optional')

source=("$pkgname::git+https://github.com/${_author}/optional.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

prepare() {
  cmake -B build -S ${pkgname} \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_TESTING=OFF \
        -Wno-dev
}

package() {
  make -C build DESTDIR=$pkgdir install
}
