# Maintainer: Javier Tiá <javier dot tia at gmail dot com>
# Contributor: Daan De Meyer <daan.j.demeyer@gmail.com>

pkgname=reproc
pkgver=8.0.1
pkgrel=1
pkgdesc='Cross-platform library that simplifies working with external CLI applications from C and C++'
arch=('x86_64')
url='https://github.com/DaanDeMeyer/reproc'
license=('MIT')
makedepends=('cmake' 'gcc')
source=("${url}/archive/v${pkgver}".tar.gz)
sha256sums=('83163ca185676b9a7cc08d97ef9173d9e7b17582e3e9fec5907d1de737a3d1c5')

build() {
  cmake \
    -S "${pkgname}-${pkgver}" \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DREPROC++=ON \
    -DREPROC_TEST=ON \
    -DREPROC_EXAMPLES=ON \
    ../
  cmake --build build
}

check() {
  build/test
}

package() {
  cmake --install build --prefix "${pkgdir}"/usr
  install -D --mode=644 "${srcdir}/${pkgname}-${pkgver}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
