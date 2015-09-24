# Maintainer: uzsolt <udvzsolt gmail com>
pkgname=tpgt
pkgver=0.6.0
pkgrel=1
pkgdesc="A ncurses-based typing trainer program."
arch=('i686' 'x86_64')
url="http://szit.hu/tpgt/"
license=('GPL2')
depends=("ncurses")
source=("http://szit.hu/$pkgname/$pkgname-$pkgver-src.tar.gz")
md5sums=('03d351f9b3081fee7b8bd850596c2de4')
sha1sums=('0a9c8f7262ea4802c20dd4b7065e8a208ac0dd48')
sha256sums=('40b6030f6fd3733d513259f06afd34dbbd749ddf976f15560b9b76382d3e1175')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s@ncursesw/@@" src/*
  sed -i "s@^CFLAGS.*@CFLAGS=${CFLAGS}@" src/Makefile
  sed -i "s@/usr/local@/usr@g" src/*
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d $pkgdir/usr/{bin,share/{doc/tpgt,tpgt/lessons/{hu,en},locale/hu/LC_MESSAGES}}
  install -m644 po/hu/LC_MESSAGES/tpgt.mo $pkgdir/usr/share/locale/hu/LC_MESSAGES
  install -m755 src/tpgt $pkgdir/usr/bin
  install -m644 doc/{,hu/}*.txt $pkgdir/usr/share/doc/tpgt
  for lang in hu en; do
    install -m644 lessons/${lang}/* $pkgdir/usr/share/tpgt/lessons/${lang}
  done
  install -m644 ChangeLog README README.hu $pkgdir/usr/share/doc/tpgt
}

