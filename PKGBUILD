# Maintainer: Zezadas <zezadasmoreira@gmail.com>

pkgname=gr-ham-git
pkgver=r25.7ece28e
pkgrel=1
pkgdesc="A collection of GNU Radio blocks useful for amateur radio"
arch=('any')
url="https://github.com/argilo/gr-ham.git"
license=(unknown)
depends=('gnuradio' 'libosmocore')
makedepends=('cmake')
provides=('gr-ham')
source=('git://github.com/argilo/gr-ham.git') 
sha1sums=('SKIP')
_gitname=gr-ham


pkgver() {
  cd $_gitname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
