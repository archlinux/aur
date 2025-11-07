# Maintainer: Lazy Seldi <dex0aur@gmail.com>
pkgname=lib-lazybios
pkgver=1.3.0
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/v$pkgver/lazybios-$pkgver.tar.gz")
sha256sums=('d3467379af9f0c8a9d80c6486072fd1944f15cd0d06c5ab0e40f891d96771c3f')

build() {
  cd "$srcdir/lazybios-$pkgver"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/lazybios-$pkgver/build"
  make DESTDIR="$pkgdir" install
  
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
