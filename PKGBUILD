# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=showmypictures
pkgver=0.2.8
pkgrel=2
pkgdesc="Memories is an photo manager for Pantheon, developed by Artem Anufrij"
arch=('x86_64')
url="http://anufrij.org/memories"
license=('GPL3')
depends=('libgranite.so' 'gtk3' 'libgexiv2' 'sqlite')
makedepends=('vala' 'cmake' 'cmake-modules-elementary-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/showmypictures/archive/${pkgver}.tar.gz")
sha256sums=('11f82cd9c12c80f90b22843807f1355bff7331643f4acbfe9f40d1cf79dd15d6')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
