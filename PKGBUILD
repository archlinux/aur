# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=frozen
pkgver=r152.5f90070
pkgrel=1
pkgdesc="Header-only C++ library that provides 0 cost initialization for immutable containers"
arch=('any')
url="https://github.com/serge-sans-paille/frozen"
license=('Apache')
makedepends=('cmake')

source=('git://github.com/serge-sans-paille/frozen.git')
sha256sums=('SKIP')

pkgver() {
  cd frozen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/${pkgname}/build"
  cd "${srcdir}/${pkgname}/build"

  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make install

  cd "${srcdir}/${pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
