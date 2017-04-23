# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxcpp
pkgver=5.0.1
pkgrel=1
pkgdesc="A library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxcpp"
license=('GPL')
depends=('gromacs>=2016')
makedepends=('cmake')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('49e828b125fef173b52091ea51be3c9e46ad8f8b50b3f14f0d0ea492fd54dca19ca7b22e40a41bc3a02f7563d8aa87ed7105826e1c618ab472be108641ffa739')

build() {
  mkdir -p build
  cd build
  cmake $srcdir/"$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
