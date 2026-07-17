# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lib-lazybios
pkgver=0.4.0
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/$pkgver/lazybios$pkgver.tar.gz")
sha256sums=('a8470bfc41196479f577b1ac3a7b0156a3fec75364c5014a9d533143396f96a3')

build() {
  cd "$srcdir/lazybios$pkgver"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/lazybios$pkgver/build"
  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
