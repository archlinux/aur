# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=kf5-kio-ftps
pkgver=0.3
pkgrel=1
pkgdesc="Implements the ftp encryption scheme called ftps, based on rfc 4217"
arch=("x86_64")
url="https://github.com/Akimkin/kf5-kio-ftps"
license=('GPL2')
depends=('kio')
makedepends=('cmake' 'kdelibs4support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b69b5b7c7aeee456b8c45168818c086692112dc58a3d9982c41cca7d43284e0a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@KDE_EXPORT@Q_DECL_EXPORT@g' ftp.cpp
}

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake ../"$pkgname-$pkgver" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_CXX_FLAGS="-I/usr/include/KF5/KDELibs4Support $CXXFLAGS"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
