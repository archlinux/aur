# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Greg Bouzakis <gregbouzakis@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Philipp Giebel <arch@ambience-design.net>

pkgname=keepassx
pkgver=0.4.4
pkgrel=3
pkgdesc='Password manager'
arch=('x86_64')
url='http://www.keepassx.org'
license=('GPL2')
depends=('libxtst' 'qt4' 'shared-mime-info')
makedepends=('optipng')
source=(https://www.keepassx.org/releases/$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('3e27068ca85e68705347f0921c6b3c9248d7c5a84c79c0483daf22d141c0adc4'
            'SKIP')
validpgpkeys=('164C70512F7929476764AB56FE22C6FD83135D45') # Felix Geyer <felix@fobos.de>

prepare() {
  cd $pkgname-$pkgver
  sed -i '1,1i#include <unistd.h>' src/lib/random.cpp
  find -name '*.png' -exec optipng -quiet -force -fix {} \;
}

build() {
  cd $pkgname-$pkgver
  qmake-qt4
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
