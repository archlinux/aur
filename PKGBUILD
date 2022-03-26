# Maintainer: Vadim Yanitskiy <axilirator@gmail.com>

pkgname=gr-iridium-git
pkgver=r302.b5ae843
pkgrel=1
pkgdesc="Gnuradio blocks and tools for receiving Iridium transmissions"
arch=('any')
url="https://github.com/muccc/gr-iridium"
license=('GPL3')
depends=('gnuradio' 'gnuradio-osmosdr' 'python')
makedepends=('git' 'cmake' 'boost')
provides=('gr-iridium')
source=('git+https://github.com/muccc/gr-iridium')
sha1sums=('SKIP')
_gitname=gr-iridium

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_gitname
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
