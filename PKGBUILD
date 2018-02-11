# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=libnitrokey
pkgver=3.2
pkgrel=5
pkgdesc="Communicate with Nitrokey stick devices in a clean and easy manner"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('LGPL3')
depends=(hidapi)
makedepends=('cmake' 'qt5-tools')
source=("https://github.com/Nitrokey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b4ebffcf2143fb2cf535200a1f77ac123d50d87747e40ff8587f3fad2f2cb0fa')

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
