# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=gr-op25-git
pkgver=2051a96
pkgrel=1
pkgdesc="Software-defined analyzer for APCO P25 signals"
arch=('any')
url="http://op25.osmocom.org/trac/wiki/"
license=('GPL')
depends=('gnuradio' 'boost' 'libpcap' 'gnuradio-osmosdr' 'itpp')
makedepends=('cmake')
provides=('gr-gsm')
source=('git://op25.osmocom.org/op25.git')
sha1sums=('SKIP')
_gitname=op25

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
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
