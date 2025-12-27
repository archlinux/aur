# Maintainer: Lazy Seldi <dex0aur@gmail.com>
pkgname=lib-lazybios
pkgver=3.2.0
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/v$pkgver/lazybios-$pkgver.tar.gz")
sha256sums=('ab3f64803565c5aef7f25ecb6e2046456de4635200b0dd066a548b96dd0e0242')

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
