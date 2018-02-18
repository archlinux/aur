# Maintainer: liberodark

pkgname=scram
pkgver=0.16.2
pkgrel=1
pkgdesc='Probabilistic risk analysis tool'
arch=('x86_64')
url='https://scram-pra.org/'
license=('GPL3')
depends=('boost-libs' 'gperftools' 'libxml2' 'qt5-base' 'qt5-tools' 'qt5-svg')
makedepends=('boost' 'cmake' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rakhimov/scram/archive/$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_GUI=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DINSTALL_LIBS=OFF
  make
}

package() {
  cd $pkgname-$pkgver
  make -C build DESTDIR="$pkgdir" install
  install -p -D -m 644 doc/scram.h2m -t "$pkgdir/usr/share/man/man1/"
  install -p -D -m 644 scripts/scram "$pkgdir/usr/share/bash-completion/completions/scram"
}
