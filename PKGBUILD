# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=restbed-latest
pkgver=4.5.RC1
pkgrel=1
pkgdesc="A framework for asynchronous RESTful functionality in C++11 applications"
arch=('i686' 'x86_64')
url="https://github.com/Corvusoft/restbed"
license=('AGPL3')
depends=('asio-latest')
conflicts=('restbed')
provides=('restbed')
optdepends=('openssl')
makedepends=('git' 'cmake' 'kashmir')
source=("restbed-4.5-RC1.tar.gz::https://github.com/Corvusoft/restbed/archive/4.5-RC1.tar.gz")
md5sums=('903bf8bb54ed2c91a1978fb200ca8c32')

build() {
  cd "$srcdir/restbed-4.5-RC1"

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/restbed-4.5-RC1/build"

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/lib/"
  mv "$pkgdir/usr/library/librestbed.a" "$pkgdir/usr/lib"
  rmdir "$pkgdir/usr/library/"
}
