# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Roberto Hueso < roberto at robertohueso dot org >

pkgname=ensmallen
pkgver=2.21.0
pkgrel=1
pkgdesc="Flexible C++ header library for efficient mathematical optimization"
arch=(any)
url="https://ensmallen.org/"
license=(BSD)
makedepends=(cmake openmp armadillo lapack)
source=("https://ensmallen.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('076f9d84e1ebc84c0ae19ee63accfc8fd3ec850f8993784bd9277776c3af2932')

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
