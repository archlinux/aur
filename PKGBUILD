# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=glbsp
pkgver=2.24
pkgrel=4
pkgdesc="A node builder for OpenGL-based Doom ports"
arch=('i686' 'x86_64')
url="http://glbsp.sourceforge.net/"
license=('GPL')
depends=('fltk>=1.1.7')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_src_224.tar.gz)
sha256sums=('e3b7c4bce21c2f9b77732a9b5920b6877e884b31dd1ed9273776538dba48a75c')

build() {
  cd $pkgname-$pkgver-source
  
  ln -sf Makefile.unx Makefile

  make glBSPX BASE_FLAGS="${CFLAGS} -Isrc -DUNIX -DINLINE_G=inline" || return 1
}

package() {
  cd $pkgname-$pkgver-source

  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make INSTALL_PREFIX=$pkgdir/usr install

  install -m755 glBSPX $pkgdir/usr/bin/glbspx
  install -Dm644 libglbsp.a $pkgdir/usr/lib/libglbsp.a
  install -Dm644 src/glbsp.h $pkgdir/usr/include/glbsp.h
}
