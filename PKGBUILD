# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=libnitrokey
pkgver=3.4.1
pkgrel=1
pkgdesc="Communicate with Nitrokey stick devices in a clean and easy manner"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('LGPL3')
depends=(hidapi)
makedepends=('cmake' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nitrokey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('224c92023a7b8ef88e7c66d158c9593fb309956dca4523bc3c5d1615a137cef6')

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
