# Maintainer: lmartinez-mirror
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>
pkgname=heimer
pkgver=2.3.0
pkgrel=1
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('gcc-libs' 'hicolor-icon-theme' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('3b2aa5e012007543eeaa5b6af26a03c847dfdd7622cdb2129144ec6ef8d69418')

prepare() {
  test -d "$pkgname-$pkgver" || mv "Heimer-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  test -d build || mkdir -p build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" make install -C build
  install -Dm 444 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
