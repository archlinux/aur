# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdeutils
pkgver=1.1.2
pkgrel=1
pkgdesc="Historical copy of the utility applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdeutils"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs")
makedepends=("cmake")
_commit="1c14d5cdf59803a8f41165e296f37837e102696d"
source=("https://github.com/KDE/$pkgname/archive/$_commit.tar.gz")
sha256sums=('7f07ed51ef70cfaeead5caef34dd96de173978c6c0d5babaeb785a1b2c4308ae')

#prepare() {
#  cd $srcdir/$pkgname-$_commit
#  patch -p1 kmail/CMakeLists.txt < $srcdir/kmail_cmake.diff
#}

build() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib'
  make
}

package() {
  cd $srcdir/$pkgname-$_commit
  cd build
  make DESTDIR="$pkgdir/" install
  cd ..  
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
