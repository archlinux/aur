# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Roberto Hueso < roberto at robertohueso dot org >

pkgname=ensmallen
pkgver=2.22.1
pkgrel=1
pkgdesc="Flexible C++ header library for efficient mathematical optimization"
arch=(any)
url="https://ensmallen.org/"
license=(BSD-3-Clause)
makedepends=(cmake openmp armadillo lapack)
source=("https://ensmallen.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('daf53fe96783043ca33151a3851d054a826fab8d9a173e6bcbbedd4a7eabf5b1')

build() {
  cmake -B build -S "$pkgname-$pkgver" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D "$pkgname-$pkgver"/LICENSE.txt  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
