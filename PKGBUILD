# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=libcprime
pkgver=4.5.0
pkgrel=1
pkgdesc="A library for bookmarking, saving recent activites, managing settings of C-Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake' 'ninja')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('75e0a334436e3ee45a37377852add2ea')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}
