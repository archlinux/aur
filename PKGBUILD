# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Astor Castelo <amcastelo[at]gatech[dot]edu>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=chipmunk
pkgver=7.0.3
pkgrel=1
pkgdesc="A high-performance 2D rigid body physics library"
arch=('i686' 'x86_64')
url="https://chipmunk-physics.net/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/slembcke/Chipmunk2D/archive/Chipmunk-${pkgver}.tar.gz")
sha256sums=('1e6f093812d6130e45bdf4cb80280cb3c93d1e1833d8cf989d554d7963b7899a')

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_DEMOS=OFF \
        -DCMAKE_C_FLAGS="-DCHIPMUNK_FFI" \
        ../Chipmunk2D-Chipmunk-${pkgver}
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/Chipmunk2D-Chipmunk-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
