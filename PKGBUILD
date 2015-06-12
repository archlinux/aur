# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=generatorrunner-git
pkgver=0.6.13.17.gbbb7d41
pkgrel=1
pkgdesc="A binding generator"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.pyside.org"
depends=('apiextractor-git' 'qt4>=4.7' 'openssl')
makedepends=('cmake' 'automoc4' 'git')
provides=("generatorrunner")
conflicts=("generatorrunner")
source=($pkgname::git://github.com/PySide/Generatorrunner.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build && cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF
  make
}

package() {
  cd $srcdir/$pkgname/build
  make DESTDIR=$pkgdir install
}

