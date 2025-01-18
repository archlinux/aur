# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=libcprime
pkgver=4.5.0
pkgrel=2
pkgdesc="A library for bookmarking, saving recent activites, managing settings of C-Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=('qt5-base')
makedepends=(
            'cmake'
            'ninja'
)
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('0ea4ac3a8de364ec9e73c2b84685a95e872242e4dd3abef923efae0826f289fe')

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
