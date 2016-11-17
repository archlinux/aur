# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=restbed-latest
pkgver=4.0.r98.ga98d431
pkgrel=1
epoch=1
pkgdesc="A framework for asynchronous RESTful functionality in C++11 applications"
arch=('i686' 'x86_64')
url="https://github.com/Corvusoft/restbed"
license=('AGPL3')
depends=('openssl')
conflicts=('restbed')
provides=('restbed')
makedepends=('git' 'cmake' 'kashmir' 'asio-latest')
source=("git://github.com/Corvusoft/restbed#commit=a98d431dd6c0bc0f5774c830c3df3356553b0add")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/restbed"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/restbed"

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED=on
  make
}

package() {
  cd "$srcdir/restbed/build"

  make DESTDIR="$pkgdir" install
}
