# Maintainer: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=kde1-kdetoys
pkgver=1.1.2
pkgrel=1
pkgdesc="Historical copy of the toys module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdetoys"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs")
makedepends=("cmake")
_commit="b57e80c105e3c1269c23b438e9be3974ef60c943"
source=("https://github.com/z3ntu/$pkgname/archive/$_commit.zip")
sha256sums=('ce5233e61fd313b3582958e0655131f44b06103c6e382634e915ffb980f3eaeb')

#prepare() {
#  cd $srcdir/$pkgname-$_commit
#  patch -p1 kfm/pics/CMakeLists.txt < $srcdir/kfm_CMakeLists.patch
#}

build() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib64'
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
