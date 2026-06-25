# Maintainer: Lazy Seldi <dex0aur@gmail.com>
pkgname=lib-lazybios
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/v$pkgver/lazybios-$pkgver.tar.gz")
sha256sums=('1441aeb98dbb1c0e18335b01bf1ac75830a77be2302e6a88e396a750aba56314')

build() {
  cd "$srcdir/lazybios"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/lazybios/build"
  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
