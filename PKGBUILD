# Maintainer: argymeg <argymeg at gmail dot com>
# Contributor Tondu < thomas.gastine at wanadoo dot fr >
# Contributor: buddabrod < buddabrod at gmail dot com >

pkgname=kaffeine-git
pkgver=r1243.f019c4f
pkgrel=1
pkgdesc='KDE media player'
license=(GPL)
arch=(i686 x86_64)
url="http://kaffeine.kde.org"
depends=(kio hicolor-icon-theme libxss vlc)
makedepends=(git extra-cmake-modules kidletime)
provides=('kaffeine')
conflicts=('kaffeine')
source=('git://anongit.kde.org/kaffeine.git')
md5sums=('SKIP')

pkgver() {
  cd kaffeine
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kaffeine \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
