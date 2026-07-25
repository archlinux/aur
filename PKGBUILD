# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lib-lazybios
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('LGPL2.1')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/$pkgver/lazybios$pkgver.tar.gz")
sha256sums=('3aeed17429dcee66b1a70cf784f25ee3f4d42c8b27fb4a06a42a6c720a28d95e')

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
