# Maintainer: Victor Hermann Chiletto <victor dot vasconceloschiletto at gmail dot com>

pkgname=livestreamer-gtkmm3-git
pkgver=r22.65f50cc
pkgrel=1
pkgdesc="A GTKMM3 UI for streamlink"
arch=('i686' 'x86_64')
url="https://github.com/vitorhnn/livestreamer-gtkmm3"
license=('MIT') 
depends=('gtkmm3' 'desktop-file-utils' 'streamlink')
makedepends=('git' 'cmake')
provides=('livestreamer-gtkmm3')
conflicts=('livestreamer-gtkmm3')
source=('git+https://github.com/vitorhnn/livestreamer-gtkmm3#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "livestreamer-gtkmm3"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "livestreamer-gtkmm3"
  mkdir -p "build"
  cd "build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "livestreamer-gtkmm3/build"
  make DESTDIR="$pkgdir" install

  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/livestreamer-gtkmm3/LICENSE"
}

# vim:set ts=2 sw=2 et:
