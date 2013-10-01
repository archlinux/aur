# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=qwad
pkgver=0.9
pkgrel=1
pkgdesc="A Python-Qt utility to manage Wad files with NUS downloader for Wii"
arch=('any')
url="http://www.nanolx.org/"
license=('GPL3')
depends=('python2-crypto' 'python2-pyqt')
source=("http://nanolx.org/downloads/Qwad/${pkgname}_${pkgver}.tar.bz2")
md5sums=('0481b2115bb02b838f5ad5324b2c9afb')
sha256sums=('10689ff8a457ec25726ed1500c5a2c8013661a8e9e56342d8d425155214cbc2b')

prepare() {
  cd "$srcdir/${pkgname}_${pkgver}"

  # QT 4 fix
  sed -i -e "s|-lrelease|-lrelease-qt4|" Makefile
}

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # build translation(s)
  make
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}"

  DESTDIR="$pkgdir" make install

  # python 2 fix
  sed -i -e "s|python|/usr/bin/env python2|" $pkgdir/usr/bin/$pkgname
}
