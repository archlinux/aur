# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=corearchiver
pkgver=4.3.0
pkgrel=1
pkgdesc="Archiver from the C Suite to create and extract archives"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime>=2.7.1' 'libarchive-qt')
makedepends=('cmake' 'ninja')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('4f118edc8b23946e201d1bdbf54e015c')

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
