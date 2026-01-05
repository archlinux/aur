pkgname=('mingw-w64-inja')
pkgver=3.5.0
pkgrel=1
pkgdesc='A template engine for modern C++ (mingw-w64)'
url='https://pantor.github.io/inja/'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-nlohmann-json')
source=("https://github.com/pantor/inja/archive/v${pkgver}.tar.gz")
sha256sums=('a5f0266673c59028eab6ceeddd8b862c70abfeb32fb7a5387c16bf46f3269ab2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd inja-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_TESTING=OFF -DBUILD_BENCHMARK=OFF -DINJA_USE_EMBEDDED_JSON=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/inja-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
  done
}
