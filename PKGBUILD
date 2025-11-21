# Maintainer: Lazy Seldi <dex0aur@gmail.com>
pkgname=lib-lazybios
pkgver=1.3.1
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/v$pkgver/lazybios-$pkgver.tar.gz")
sha256sums=('58b1691bd590b2a24e45d7a98cb370d2c46c626d0dc5327a6dc28a80b24f32c8')

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
