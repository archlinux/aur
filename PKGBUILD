# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=libmaus
pkgver=2.0.504
pkgrel=1
_release=20180619115641
pkgdesc="Bioinformatics data structures and algorithms in C++"
arch=('x86_64')
url=https://gitlab.com/german.tischler/libmaus2
license=('GPL2')
source=(https://gitlab.com/german.tischler/"${pkgname}"2/-/archive/"${pkgver}"-release-20180619115641/"${pkgname}"2-"${pkgver}"-release-"${_release}".tar.gz)
sha256sums=('e134287064723593844fd9bff35872e2e618d825e3389166cfbba2b49ff3bcc5')

prepare() {
  cd "${srcdir}"/libmaus2-"${pkgver}"-release-"${_release}"
  make clean
}

build() {
  cd "${srcdir}"/libmaus2-"${pkgver}"-release-"${_release}"
  ./configure --prefix="${pkgdir}"/usr/local --exec-prefix "${pkgdir}"/
  make
}

check() {
  cd "${srcdir}/libmaus2-${pkgver}-release-${_release}"
  make test
}

package() {
  cd "${srcdir}"/libmaus2-"${pkgver}"-release-"${_release}"
  make install && mv "${pkgdir}"/lib "${pkgdir}"/usr/lib
  install -Dm644 AUTHORS "${pkgdir}"/usr/share/licenses/"${pkgname}"2/AUTHORS
}
