# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Roberto Hueso < roberto at robertohueso dot org >

pkgname=ensmallen
pkgver=2.20.0
pkgrel=1
pkgdesc="Flexible C++ header library for efficient mathematical optimization"
arch=(any)
url="https://ensmallen.org/"
license=(BSD)
makedepends=(cmake openmp armadillo lapack)
source=("https://ensmallen.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5c7cea756e544795b3861d171f7cc28ba0a0be6297f84026b0b17e1dfc583f24')

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
