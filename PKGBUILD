# Maintainer: EndlessEden <eden [at] rose.place>
# Upstream Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>

pkgname="dabtools-git"
_pkgname="dabtools"
pkgver=0.01.f8003df
pkgrel=1
pkgdesc='DAB/DAB+ software for RTL-SDR dongles and the Psion Wavefinder including ETI stream recording.'
arch=('x86_64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
depends=('rtl-sdr' 'fftw')
makedepends=('git' 'cmake')
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(echo 0.01).$(git rev-parse --short HEAD)

}


build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release 

  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="$pkgdir" install
}

