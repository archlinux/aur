# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=restbed-latest
pkgver=4.5.RC1.r0.g2cd6f2e
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
source=("git+https://github.com/Corvusoft/restbed#commit=2cd6f2e376483e82776dc010100d6e2d97042a9d")
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
