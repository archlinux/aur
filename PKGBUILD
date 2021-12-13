# Maintainer: zezadas <zezadasmoreira at gmail dot com>

pkgname=gr-mixalot-git
pkgver=v93.6c01f75
pkgrel=1
pkgdesc="POCSAG encoder blocks for GNU radio"
arch=('any')
url="https://github.com/unsynchronized/gr-mixalot"
license=(unknown)
depends=('gnuradio<3.9' 'libosmocore' 'boost' 'swig' 'itpp')
makedepends=('cmake')
provides=('gr-mixalot')
source=('git+https://github.com/unsynchronized/gr-mixalot.git') 
sha1sums=('SKIP')
_gitname=gr-mixalot

pkgver() {
  cd $_gitname
  printf "v%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -p0 -i ../utils_itpp.patch
}

build() {
  cd $_gitname
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_gitname"/build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
