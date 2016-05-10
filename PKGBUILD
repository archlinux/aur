# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkcompactdisc
pkgver=16.04.1
pkgrel=1
pkgdesc="A library for interfacing with CDs"
url='https://www.kde.org/applications/multimedia/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
replaces=('kdemultimedia-kioslave')
conflicts=('kdemultimedia-kioslave')
source=("http://download.kde.org/stable/applications/${pkgver}/src/${pkgname}-${pkgver}.tar.xz")
sha1sums=('61f90ee3c48c51d1491b33758ffd98db4c12efe9')

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
