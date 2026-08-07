# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lib-lazybios
pkgver=1.4.0
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('LGPL2.1')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/$pkgver/lazybios$pkgver.tar.gz")
sha256sums=('cd519f1aad16c5a9c1e55a09564db36ee96fa75a8159f43ab8f9a2909b7b91bc')

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
