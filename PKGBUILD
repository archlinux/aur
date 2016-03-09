pkgname=mingw-w64-exprtk-git
pkgver=r173.bc53259
pkgrel=1
pkgdesc="C++ Mathematical Expression Library"
arch=('any')
url="http://www.partow.net/programming/exprtk/index.html"
license=('CPL')
depends=('mingw-w64-crt')
makedepends=('git')
provides=('mingw-w64-exprtk')
conflicts=('mingw-w64-exprtk')
source=('git+https://github.com/ArashPartow/exprtk.git')
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/exprtk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/exprtk"
  for _arch in ${_architectures}; do
    install -d "${pkgdir}"/usr/${_arch}/include
    install -D -m644 exprtk.hpp "${pkgdir}"/usr/${_arch}/include
  done
}
