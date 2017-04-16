# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=soltrack
pkgver=2.1
pkgrel=1
pkgdesc="A free, fast and accurate C/C++ routine to compute the position of the Sun"
arch=('i686' 'x86_64')
url="http://soltrack.sourceforge.net/"
license=('LGPL3')
depends=('glibc')
makedepends=('cmake' 'gcc')
changelog=ChangeLog
source=("http://sourceforge.net/projects/soltrack/files/$pkgname-$pkgver.tar.gz")
sha512sums=('1ec682d0b33b8792a122663a28849e08fd985a5651430be1f812cf679d07b0719b3213905e1005b050463b9cf4686fb89f2ea1578f9e63238ff7bcc0ca0d6fe6')

prepare() {
  # Work around bug in CMakeFiles.txt:
  cd "$pkgname-$pkgver/"
  pwd
  mkdir doc/
  cp CHANGELOG LICENCE README VERSION doc/
}

build() {
    mkdir -p "$pkgname-$pkgver"/build
    cd "$pkgname-$pkgver"/build/
    cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..
    make
}

package() {
    # Install library:
    cd "$pkgname-$pkgver"/build/
    make install
}
