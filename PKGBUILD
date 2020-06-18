# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=mailio
pkgver=0.18.0
pkgrel=1
pkgdesc="A cross platform C++ library for MIME format and SMTP, POP3 and IMAP protocols."
_pkgfilename="version_${pkgver//\./-}"
url="https://github.com/karastojko/mailio"
arch=('i686' 'x86_64')
provides=('mailio')
makedepends=('cmake' 'boost' 'openssl' 'doxygen')
depends=('boost' 'openssl')
source=("https://github.com/karastojko/$pkgname/archive/$_pkgfilename.tar.gz")
sha256sums=('3bd51cab1d1914eaedf03e94aaa8ebab8abe9e9249f93f373fdbac39bc2fb7ab')

build() {
  cd "$srcdir/$pkgname-$_pkgfilename"
#rm -rf build
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
  cd "$srcdir/$pkgname-$_pkgfilename/build"
  make install
  cd "$pkgdir/usr"
  mkdir -p share/doc
  mv docs "share/doc/$pkgname"
  mv examples "share/doc/$pkgname/examples"
}
