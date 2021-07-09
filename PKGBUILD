# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=2.6.0
pkgrel=1
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('gcc-libs' 'hicolor-icon-theme' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
changelog=CHANGELOG
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('2d484facf1e3f8082145f94a30a65db661260aeec951c789647be0a895087dcb')

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
