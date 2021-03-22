# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=mailio
pkgver=0.20.0
pkgrel=1
pkgdesc="A cross platform C++ library for MIME format and SMTP, POP3 and IMAP protocols."
url="https://github.com/karastojko/mailio"
arch=('i686' 'x86_64')
provides=('mailio')
makedepends=('cmake' 'boost' 'openssl' 'doxygen')
depends=('boost' 'openssl')
source=("https://github.com/karastojko/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('073d6b1ff891444b54a01c2a3f17074fd612f9e2e14d9ebd61863c70737b1882')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DBoost_DIR="/usr/lib/cmake/Boost-1.72.0"
  make -j
  make docs -j
  mkdir docs
  mv html latex docs
}

package() {
  umask 022
  cd "$srcdir/$pkgname-$pkgver/build"
  make install
  cd "$pkgdir/usr"
  mkdir -p share/doc
  mv docs "share/doc/$pkgname"
  mv "share/$pkgname/examples" "share/doc/$pkgname/examples"
  rmdir "share/$pkgname"
}
