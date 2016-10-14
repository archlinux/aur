# Maintainer: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=kde1-kdelibs
pkgver=1.1.2
pkgrel=1
pkgdesc="Historical copy of the libraries module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdelibs"
license=("GPL2" "LGPL2")
groups=("kde1")
depends=("qt1" "libpng" "libjpeg-turbo" "libtiff")
makedepends=("cmake")
_commit="98b923b0a56423c6de5c5f2f68f457249b3e3cf6"
source=("https://github.com/KDE/$pkgname/archive/$_commit.zip")
sha256sums=('be19075ccddb1141267cc445a3025ebb4654d0dc4e928580c571f16c699c59a6')

build() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd $srcdir/$pkgname-$_commit
  cd build
  make DESTDIR="$pkgdir/" install
  cd ..  
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYING.LIB $pkgdir/usr/share/licenses/$pkgname/COPYING.LIB
}

# vim:set ts=2 sw=2 et:
