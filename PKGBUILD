pkgname=mingw-w64-stb-git
pkgver=r1865.f54acd4
pkgrel=1
pkgdesc="single-file public domain (or MIT licensed) libraries for C/C++ (mingw-w64)"
arch=('any')
url="https://github.com/nothings/stb"
license=('public domain' 'MIT')
makedepends=('git')
provides=('mingw-w64-stb')
conflicts=('mingw-w64-stb')
source=("git+https://github.com/nothings/stb.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}"/stb
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/stb
    install -d "$pkgdir"/usr/${_arch}/include/stb
    install -m644 *.h "$pkgdir"/usr/${_arch}/include/stb
    install -m644 *.c "$pkgdir"/usr/${_arch}/include/stb
  done
}
