# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

pkgname='gr-foo'
pkgver=e17edbd
pkgrel=1
pkgdesc="gnuradio custom blocks by bastibl"
arch=('any')
url="https://github.com/bastibl/gr-foo"
license=('unknown')
depends=('gnuradio' 'libuhd' 'boost-libs')
makedepends=('cmake' 'swig' 'boost')
provides=('gr-foo')
source=('git+https://github.com/bastibl/gr-foo')
sha1sums=('SKIP')
_gitname=gr-foo

pkgver() {
  cd "$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$_gitname"
  git checkout maint-3.8
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$_gitname"
  cd build
  make DESTDIR=${pkgdir} install
  cd ..
  rm -rf build
}

# vim:set ts=2 sw=2 et:
