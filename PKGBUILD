# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdegames
pkgver=1.1.2
pkgrel=1
pkgdesc="Historical copy of the gaming applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdegames"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs")
makedepends=("cmake")
_commit="0c70bf0d7c9ace37095e4a02bed921f4e301f17a"
source=("https://github.com/KDE/$pkgname/archive/$_commit.zip")
sha256sums=('f6b4006f83e282c581ae1c6033455d68138046967644bfb92764fc5af8f64164')

#prepare() {
#  cd $srcdir/$pkgname-$_commit
#  patch -p1 kfm/pics/CMakeLists.txt < $srcdir/kfm_CMakeLists.patch
#}

build() {
  cd $srcdir/$pkgname-$_commit
  #cd $srcdir/$pkgname
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib'
  make
}

package() {
  cd $srcdir/$pkgname-$_commit
  #cd $srcdir/$pkgname
  cd build
  make DESTDIR="$pkgdir/" install
  cd ..  
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
