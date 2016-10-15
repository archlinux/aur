# Maintainer: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=kde1-kdelibs
pkgver=1.1.2
pkgrel=3
pkgdesc="Historical copy of the libraries module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdelibs"
license=("GPL2" "LGPL2")
groups=("kde1")
depends=("qt1" "libpng" "libjpeg-turbo" "libtiff")
makedepends=("cmake")
_commit="045c89f8a71d521897bb6ac2447f0d396c2d1016"
source=("https://github.com/KDE/$pkgname/archive/$_commit.zip")
sha256sums=('7270c0e1d5fc55643a1faabae0003a6a1b39ade5ce6465d8965fe2bc3acd4409')

#prepare() {
#  cd $srcdir/$pkgname-$_commit
#  patch -p1 cmake/KDE1Macros.cmake < $srcdir/KDE1Macros.patch
#}

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
