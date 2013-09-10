# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=libkscreen
pkgver=1.0.1
pkgrel=2
pkgdesc="KDE's screen management library"
arch=('i686' 'x86_64')
url='https://projects.kde.org/libkscreen'
license=('GPL')
depends=('kdelibs' 'qjson')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2"
        'kdebug-324625.patch')
md5sums=('52aeaf2d987bffd05b111e89b445bd00'
         '2f670035b94c6d61c4a3d1c4230db4b5')

prepare() {
  mkdir build

  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/kdebug-324625.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
