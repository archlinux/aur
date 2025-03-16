# Maintainer: Kino <cybao292261@163.com>
# Contributor: Kartik Mohta <kartikmohta@gmail.com>
pkgname=g2o
pkgver=20241228
pkgrel=2
pkgdesc="A General Framework for Graph Optimization"
arch=('x86_64')
url="https://github.com/RainerKuemmerle/g2o"
license=('BSD-3-Clause' 'GPL-3.0-or-later' 'LGPL-2.1-or-later')
makedepends=('cmake')
depends=('eigen' 'fmt' 'glu' 'openblas' 'qt5-declarative' 'spdlog' 'suitesparse' 'libqglviewer-qt5')
conflicts=('g2o-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RainerKuemmerle/g2o/archive/${pkgver}_git.tar.gz")
sha256sums=('d691ead69184ebbb8256c9cd9f4121d1a880b169370efc0554dd31a64802a452')

build() {
  cmake -B build -S $pkgname-${pkgver}_git \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release \
        -DG2O_BUILD_APPS=ON \
        -DG2O_BUILD_EXAMPLES=OFF \
        -DBUILD_UNITTESTS=ON \
        -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}_git/doc/license-bsd.txt ${pkgdir}/usr/share/licenses/${pkgname}/license-bsd.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}_git/doc/license-gpl.txt ${pkgdir}/usr/share/licenses/${pkgname}/license-gpl.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}_git/doc/license-lgpl.txt ${pkgdir}/usr/share/licenses/${pkgname}/license-lgpl.txt
}
