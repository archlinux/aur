# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=locale-en_ru
pkgver=0.5.5
pkgrel=1
pkgdesc='English language locale for Russia'
arch=(any)
license=(GPL3)
makedepends=(make perl)
source=(https://master.dl.sourceforge.net/project/en-ru/0.5.5/locale-en_RU-0.5.5.tar.gz?viasf=1
  locale-en_ru.install
  locale-en_ru.hook)
sha1sums=("c82dc3f2947eaf8a83bf53c5f1ecfacb3743bbe7"
  "d8e7ea79941e69d13d0e4851762f4e6029574378"
  "d8f6a058eda3c7596e563a19d55d88c4fc548e6f")
md5sums=("243ec7798704c5de088045831d2cf145"
  "549b2a924c93f2366e4b00e2c0bfc408"
  "231deca63eac4228f72deabbafa2e406")
install="locale-en_ru.install"
build() {
  cd $srcdir/locale-en_RU-$pkgver
  mkdir _build
  cd _build
  ../configure --prefix=/usr --disable-rpm --disable-html --enable-ruble-sign
  make
}
package() {
  cd $srcdir/locale-en_RU-$pkgver/_build
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/libalpm/hooks
  cp $srcdir/locale-en_ru.hook $pkgdir/usr/share/libalpm/hooks
}
