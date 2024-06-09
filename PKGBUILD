# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Roberto Hueso < roberto at robertohueso dot org >

pkgname=ensmallen
pkgver=2.21.1
pkgrel=1
pkgdesc="Flexible C++ header library for efficient mathematical optimization"
arch=(any)
url="https://ensmallen.org/"
license=(BSD)
makedepends=(cmake openmp armadillo lapack)
source=("https://ensmallen.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('820eee4d8aa32662ff6a7d883a1bcaf4e9bf9ca0a3171d94c5398fe745008750')

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
