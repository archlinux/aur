# Maintainer: Anatol Pomozov

pkgname=omim-git
pkgver=r12162.8214307
pkgrel=1
pkgdesc='Offline OpenStreetMap maps'
arch=(i686 x86_64)
url='http://maps.me/en/home'
license=(Apache)
depends=(boost-libs qt5-base)
makedepends=(boost cmake)
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
  qmake-qt5 omim.pro -spec linux-clang
  make
}

package() {
  cd omim
  INSTALL_ROOT="$pkgdir" make install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
