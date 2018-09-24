# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Roman Porizka <artee@beer.cz>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Semen Soldatov <simplexe@mail.ru>

pkgname=sqliteman
pkgver=1.2.2
pkgrel=12
pkgdesc='Graphical sqlite3 browser and editor'
arch=('i686' 'x86_64')
url='http://sqliteman.yarpen.cz/'
license=('GPL')
depends=('qscintilla-qt5')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "0001_qt5.patch"
        "0002_lpthread.patch"
        "0003_icons.patch")
md5sums=('5ecdf710e23606e1b924f740ea69306d'
         '8e0fadd613f819d3814c24c28287c4e4'
         '8e24fc6b9231e7307bd6a86af8f4796a'
         '7976cef250c2a1fd49607cd5f1cd21d2')

prepare() {
  mkdir build

  cd ${pkgname}-${pkgver}
  patch -p1 -i ../0001_qt5.patch
  patch -p1 -i ../0002_lpthread.patch
  patch -p1 -i ../0003_icons.patch

}

build() {
  cd build

  # remove bundled lib
  rm -rf {$pkgname}/qscintilla2

  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
