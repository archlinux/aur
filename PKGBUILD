# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=ngsxfem-git
pkgver=NGS.User.Meeting.2018
pkgrel=1
pkgdesc="XFEM for NGSolve"
url=https://github.com/ngsxfem/ngsxfem.git
license=('LGPL2.1')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('ngsolve-git')
options=('!buildflags')
source=("${pkgname%-git}::git+https://github.com/ngsxfem/ngsxfem.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname%-git}
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "${srcdir}"/${pkgname%-git}
  rm -rf build
  mkdir build && cd build

  cmake \
    -DNGSolve_DIR=/usr \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_NGSOLVE=OFF \
    -DCMAKE_BUILD_TYPE=RELEASE \
    ..

  make
}

package() {
  cd "${srcdir}"/${pkgname%-git}/build
  make DESTDIR="$pkgdir/" install
}

