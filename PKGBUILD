# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=libcsys
pkgver=5.0.0
pkgrel=1
pkgdesc="Library for managing drive and getting system resource information in real time"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'udisks2'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('8ba5ddcdcf6162a0db229f2b95312784a30760f09e919960fedb5fd9fe7f9cb9')

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
