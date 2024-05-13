# Maintainer: Martin Diehl <aur@martin-diehl.net>
_fname=stdlib
pkgname=fortran_${_fname}
pkgver=0.6.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Fortran standard library"
url="https://github.com/fortran-lang/stdlib"
depends=('gcc-libs')
makedepends=('gcc-fortran' 'fypp' 'cmake' 'ninja')
options=('strip')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/fortran-lang/stdlib/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8ee1e571ad6cddc5894f62b344456480e9a4fd94b818ddfdd5eb36b2d5551f39aa6b2ee745106bbd5bb3f07143335b057277229487a1de437ff5ba2e6acad839')


build() {
  cmake -S stdlib-${pkgver} \
        -B build \
        -D BUILD_TESTING:BOOL=OFF \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D BUILD_SHARED_LIBS:BOOL=ON \
        -D CMAKE_BUILD_TYPE:STRING=Release
  make -C build
}

package() {
  DESTDIR=${pkgdir} cmake --install build

  install -Dm0644 "${srcdir}/stdlib-${pkgver}/LICENSE" "${pkgdir}/share/licenses/${pkgname}/LICENSE"
}
