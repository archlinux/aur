# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=juffed
pkgver=0.10
pkgrel=3
pkgdesc="Simple tabbed text editor with syntax highlighting, based on Qt4"
arch=('i686' 'x86_64')
url="https://github.com/Mezomish/juffed"
license=('GPL2')
makedepends=('cmake')
depends=('qscintilla' 'enca')
conflicts=('juffed-git' 'juffed-qt5-git')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-1054.tar.bz2
        $pkgname-build-without-error.patch::$url/commit/054bf0c0adf19a0bf5be58cf54049379f50b9211.patch
        $pkgname-fix-build-with-enca.patch::$url/commit/0f724eb1463c5bb87d04ebed32ea33d2d6e460ae.patch)
md5sums=('33ca5c94fd4aedb9925e58f8f9ba9a7c'
         'e70c3050d06d26a4f3be7d1b04140492'
         '22957a35803d971b306d8d726d5f14fe')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../$pkgname-build-without-error.patch
  patch -p1 -i ../$pkgname-fix-build-with-enca.patch
}

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DLIB_INSTALL_DIR=/usr/lib -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
