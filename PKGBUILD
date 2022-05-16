# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=mailio
pkgver=0.21.0
pkgrel=1
pkgdesc="A cross platform C++ library for MIME format and SMTP, POP3 and IMAP protocols."
url="https://github.com/karastojko/mailio"
arch=('i686' 'x86_64')
provides=('mailio')
makedepends=('cmake' 'boost' 'openssl' 'doxygen')
depends=('boost' 'openssl')
source=("https://github.com/karastojko/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8f58dfc8bcbe01224c788f22c544c27611e3c411ed5a2097488fbb32a3c0fb3d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DBoost_DIR="/usr/lib/cmake/Boost-1.72.0"
  make -j
  make docs -j
}

package() {
  umask 022
  cd "$srcdir/$pkgname-$pkgver/build"
  make install
  cd "$pkgdir/usr"
  mkdir -p share/doc
  mv docs "share/doc/$pkgname"
  mv "share/$pkgname/examples" "share/doc/$pkgname/examples"
  rm -rf "share/$pkgname"
}
