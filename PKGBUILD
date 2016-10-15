# Maintainer: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=kde1-kdebase
pkgver=1.1.2
pkgrel=3
pkgdesc="Historical copy of the base applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdebase"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs" "libjpeg" "libtiff" "perl")
makedepends=("cmake")
_commit="a55cc8cc2ba9a24f08174e311798b791148165ca"
source=("https://github.com/KDE/$pkgname/archive/$_commit.zip")
sha256sums=('66c3106845ed04ee788f0087b9f9b1dcc51dc5d9c7356ad4f4035201409daf0b')

#prepare() {
#  cd $srcdir/$pkgname-$_commit
#  patch -p1 kfm/pics/CMakeLists.txt < $srcdir/kfm_CMakeLists.patch
#  patch -p1 kwm/pics/CMakeLists.txt < $srcdir/kwm_CMakeLists.patch
#}

build() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib64'
  make
}

package() {
  # TODO : Fix icons missing
  cd $srcdir/$pkgname-$_commit
  cd build
  make DESTDIR="$pkgdir/" install
  cd ..  
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
