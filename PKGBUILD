# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Roman Porizka <artee@beer.cz>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=sqliteman
pkgver=1.2.2
pkgrel=11
pkgdesc="The best developer's and/or admin's GUI tool for Sqlite3 in the world"
arch=('i686' 'x86_64')
url="http://sqliteman.com/"
license=('GPL')
depends=('qscintilla-qt4')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz" sqliteman-qscintilla-2.10.patch)
md5sums=('5ecdf710e23606e1b924f740ea69306d'
         '9922a1f404f2381564abfb9096973911')

prepare() {
  mkdir build

# Fix qscintilla 2.10 detection
  cd $pkgname-$pkgver
  patch -p1 -i ../sqliteman-qscintilla-2.10.patch
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
