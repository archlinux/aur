# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=2.7.0
pkgrel=1
pkgdesc="Cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('gcc-libs' 'hicolor-icon-theme' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c1a59dd77ed2edfcd24ed46eb4828464f6563d3aac102878e2f2541e96481e3c')

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S "Heimer-$pkgver" \
    -B build
  make -C build
}

package() {
  DESTDIR="$pkgdir/" make install -C build
  cd "Heimer-$pkgver"
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
