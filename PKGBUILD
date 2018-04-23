# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=libnitrokey
pkgver=3.3
pkgrel=3
pkgdesc="Communicate with Nitrokey stick devices in a clean and easy manner"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('LGPL3')
depends=(hidapi)
makedepends=('cmake' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nitrokey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0de70ec8443f24d388590ec856ad6a7e409bff2acb65aa12560e828e980903d5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/"
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"

  cmake .. \
        -DBUILD_SHARED_LIBS=ON \
        -DCOMPILE_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install

  cd ..
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
