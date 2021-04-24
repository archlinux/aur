# Maintainer: lmartinez-mirror
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>
pkgname=heimer
pkgver=2.5.0
pkgrel=1
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('gcc-libs' 'hicolor-icon-theme' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('7e3c8cef61657187c1909a31c908b40268d9ecb679e18af181025d689675067f')

prepare() {
  test -d "$pkgname-$pkgver" || mv "Heimer-$pkgver" "$pkgname-$pkgver"
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S "$pkgname-$pkgver" \
    -B build
  make -C build
}

package() {
  DESTDIR="$pkgdir/" make install -C build
  cd "$pkgname-$pkgver"
  install -Dm 444 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
