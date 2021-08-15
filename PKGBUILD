# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Marcus Britanicus


pkgname=libarchive-qt
pkgver=2.0.5
pkgrel=2
pkgdesc="A Qt based archiving solution with libarchive backend"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/marcusbritanicus/$pkgname"
license=('LGPL3')
depends=('libarchive' 'qt5-base' 'zlib' 'bzip2' 'xz')
makedepends=('cmake' 'ninja')
source=("https://gitlab.com/marcusbritanicus/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('a13db50c765a2f71746fce809883fb93')

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
