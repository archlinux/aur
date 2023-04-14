# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: agomonos <eugenio89 at gmail dot com>

pkgname=booktab
pkgver=4.20
pkgrel=1
pkgdesc="MyZanichelli - La piattaforma che ti permette di consultare tutti i tuoi libri scolastici in versione multimediale e interattiva."
arch=('x86_64')
url="https://booktab.it/"
license=('unknown')
conflicts=('booktab-wine')
depends=("pcre" "openssl-1.1" "libxss" "qt5-multimedia" "qt5-svg" "qt5-webengine")

_debname=BooktabSetup.deb

source=(https://booktab.it/setup-z/$pkgver/${_debname})
md5sums=('d7316f8c392f3522c2f35f48daf05d16')

noextract=(${_debname})

options=(!strip)

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/share/duDat
  install -dm755 "$pkgdir"/usr/share/duDat/BooktabZ
  install -dm755 "$pkgdir"/usr/bin
  install -m644 usr/share/applications/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -m755 usr/bin/booktab "$pkgdir"/usr/bin/booktab

  cp -dpr --no-preserve=ownership usr/share/duDat/BooktabZ/webapps "$pkgdir"/usr/share/duDat/BooktabZ/.
  install -m644 usr/share/duDat/BooktabZ/libPDFNetC.so "$pkgdir"/usr/share/duDat/BooktabZ/libPDFNetC.so
  install -m644 usr/share/duDat/BooktabZ/booktab_icon_144x144.png "$pkgdir"/usr/share/duDat/BooktabZ/booktab_icon_144x144.png
  install -m755 usr/share/duDat/BooktabZ/btb "$pkgdir"/usr/share/duDat/BooktabZ/btb
  install -m644 usr/share/duDat/BooktabZ/extra.rcc "$pkgdir"/usr/share/duDat/BooktabZ/extra.rcc
  install -m644 usr/share/duDat/BooktabZ/icudtl.dat "$pkgdir"/usr/share/duDat/BooktabZ/icudtl.dat
  install -m644 usr/share/duDat/BooktabZ/libquazip.so.1.0.0 "$pkgdir"/usr/share/duDat/BooktabZ/libquazip.so.1.0.0
  ln -s /usr/share/duDat/BooktabZ/libquazip.so.1.0.0 "$pkgdir"/usr/share/duDat/BooktabZ/libquazip.so.1.0
  ln -s /usr/share/duDat/BooktabZ/libquazip.so.1.0.0 "$pkgdir"/usr/share/duDat/BooktabZ/libquazip.so.1
  ln -s /usr/share/duDat/BooktabZ/libquazip.so.1.0.0 "$pkgdir"/usr/share/duDat/BooktabZ/libquazip.so
}
