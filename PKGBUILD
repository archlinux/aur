# Maintainer: Javier Tiá <javier dot tia at gmail dot com>
# Contributor: Daan De Meyer <daan.j.demeyer@gmail.com>

pkgname=reproc
pkgver=10.0.3
pkgrel=1
pkgdesc='Cross-platform library that simplifies working with external CLI applications from C and C++'
arch=('x86_64')
url='https://github.com/DaanDeMeyer/reproc'
license=('MIT')
makedepends=('cmake' 'gcc')
source=("${url}/archive/v${pkgver}".tar.gz)
sha256sums=('63d89e1f5e8c3e16e0018f268b6b0b971c67ddeaf98c168ef23a8a3954b81eff')

build() {
  cmake \
    -S "${pkgname}-${pkgver}" \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DREPROCXX=ON \
    -DREPROC_TEST=ON \
    ../
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D --mode=644 "${srcdir}/${pkgname}-${pkgver}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
