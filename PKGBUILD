# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=qwad
pkgver=0.9
pkgrel=1
pkgdesc="A Python-Qt utility to manage Wad files with NUS downloader for Wii"
arch=('any')
url="http://www.nanolx.org"
license=('GPL3')
depends=('python2-crypto' 'python2-pyqt4')
source=("$url/downloads/Qwad/${pkgname}_$pkgver.tar.bz2")
sha256sums=('10689ff8a457ec25726ed1500c5a2c8013661a8e9e56342d8d425155214cbc2b')

prepare() {
  cd ${pkgname}_$pkgver

  # use QT4
  sed "s|-lrelease |-lrelease-qt4 |" -i Makefile
  # use python2
  sed "s|python |python2 |" -i qwad
}

build() {
  cd ${pkgname}_$pkgver

  # build translation(s)
  make
}

package() {
  cd ${pkgname}_$pkgver

  make DESTDIR="$pkgdir/" install

  # remove license (part of core licenses) and move doc to doc folder
  rm "$pkgdir"/usr/share/Qwad/{README,COPYING,AUTHORS}
  install -d "$pkgdir"/usr/share/doc/qwad
  install -m664 {AUTHORS,ChangeLog,CLI,CLI.Channels,README} \
    "$pkgdir"/usr/share/doc/qwad
}
