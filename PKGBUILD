# Maintainer: Roberto Nobrega <rwnobrega@gmail.com>

pkgname=gr-rds-git
_gitname=gr-rds
pkgver=r278.f1c584a
pkgrel=1
pkgdesc="An FM-RDS Receiver for GNU Radio"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnuradio')
makedepends=('git' 'boost' 'cmake' 'swig')
url="https://github.com/bastibl/gr-rds"
source=("git://github.com/bastibl/gr-rds.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_gitname}/
  git checkout maint-3.7
  mkdir -p build
  cd build/
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd ${srcdir}/${_gitname}/build/
  make DESTDIR=${pkgdir} install
}
