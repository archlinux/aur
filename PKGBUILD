# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdelibs
pkgver=1.1.2
pkgrel=4
pkgdesc="Historical copy of the libraries module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdelibs"
license=("GPL2" "LGPL2")
groups=("kde1")
depends=("qt1" "libpng" "libjpeg-turbo" "libtiff")
makedepends=("cmake")
_commit="ca9e8f0f2806ca5879ca3dccac1ca2cb5feab6fa"
source=("https://github.com/KDE/$pkgname/archive/$_commit.tar.gz")
sha256sums=('761e8a98c3c5259ed664b9ef7305192cc246c770369690c3e1d142321849bbeb')

prepare() {
  cd $srcdir/$pkgname-$_commit
  sed -i 's/lib64/lib/' cmake/FindQt1.cmake
  sed -i 's/lib64/lib/' cmake/KDE1InstallDirs.cmake
}

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
  ln -s /opt/kde1/share/doc/HTML/en/ $pkgdir/opt/kde1/share/doc/HTML/default
}

# vim:set ts=2 sw=2 et:
