# Maintainer: condy chen <condy0919@gmail.com>
pkgname=crow-git
pkgver=r1360.5f77b2bd
pkgrel=1
pkgdesc='A Fast and Easy to use microframework for the web'
arch=('any')
url="https://github.com/CrowCpp/Crow"
license=('BSD')
depends=('asio')
makedepends=('git' 'cmake' 'make' 'python')
optdepends=('openssl' 'zlib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}"::'git+https://github.com/CrowCpp/Crow.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  cmake -S. -Bbuild -DCROW_BUILD_EXAMPLES=OFF -DCROW_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/"
  cmake --build build
}

package() {
  cd "$srcdir/${pkgname}"
  cmake --install build
}
