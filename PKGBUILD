# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_pkgname=scraw
pkgname=$_pkgname-git
pkgver=0.2.0.r0.g4a95995
pkgrel=2
pkgdesc="Steam Controller C library (git version)"
arch=('i686' 'x86_64')
url="https://gitlab.com/dennis-hamester/scraw"
license=('custom:ISC')
makedepends=('cmake' 'doxygen')
depends=('libusb')
provides=('scraw')
source=("git+https://gitlab.com/dennis-hamester/scraw.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd $_pkgname
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SCRAW_INFO=ON \
    ..
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
