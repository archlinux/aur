# Maintainer: Anatol Pomozov

pkgname=omim-git
pkgver=r26171.b378c80fe3
pkgrel=1
pkgdesc='Offline OpenStreetMap maps'
arch=(i686 x86_64)
url='http://maps.me/en/home'
license=(Apache)
depends=(qt5-base qt5-webengine)
makedepends=(boost cmake clang git ninja)
source=(git://github.com/mapsme/omim)
sha1sums=('SKIP')

pkgver() {
  cd omim
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd omim
  git submodule update --init --recursive
}

build() {
  cd omim
  echo | ./configure.sh
  cmake -GNinja .
  ninja
}

package() {
  cd omim
  DESTDIR="${pkgdir}" ninja install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
