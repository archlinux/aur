# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lib-lazybios
pkgver=0.5.0
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/$pkgver/lazybios$pkgver.tar.gz")
sha256sums=('990c7f538192d965d60aa3d8989022aa7178288aedb6cd268ea3680abe7c0d72')

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
