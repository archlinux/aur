# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_pkgname=scrawpp
pkgname=$_pkgname-git
pkgver=0.2.0.r0.ge93a248
pkgrel=1
pkgdesc="Steam Controller C++ library (git version)"
arch=('any')
url="https://gitlab.com/dennis-hamester/scrawpp"
license=('custom:ISC')
makedepends=('cmake')
depends=('scraw-git')
provides=('scrawpp')
source=("git+https://gitlab.com/dennis-hamester/scrawpp.git")
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
    ..
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
