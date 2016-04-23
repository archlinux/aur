# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_pkgname=scd
pkgname=$_pkgname-git
pkgver=0.2.0.r0.g0e7a2de
pkgrel=1
pkgdesc="Free and open source driver for the Steam Controller (git version)"
arch=('i686' 'x86_64')
url="https://gitlab.com/dennis-hamester/scd"
license=('custom:ISC')
makedepends=('cmake' 'scrawpp-git')
depends=('scraw-git')
provides=('scd')
conflicts=('scd')
source=("git+https://gitlab.com/dennis-hamester/scd.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd $_pkgname
  mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 ../tinytoml/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE_tinytoml
}
