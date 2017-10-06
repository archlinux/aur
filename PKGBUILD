# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=booktab
pkgver=1.9
pkgrel=1
pkgdesc="MyZanichelli - La piattaforma che ti permette di consultare tutti i tuoi libri scolastici in versione multimediale e interattiva."
arch=('x86_64')
url="https://booktab.it/"
license=('unknown')
depends=("fontconfig" "libxrandr" "libxdamage" "libcups" "nss" "libxcursor" "gstreamer0.10-base" "libpulse" "qt5-svg" "qt5-webkit")

_debname=BooktabZSetup-16.04.deb

source=(https://booktab.it/setup-z/${_debname})
md5sums=('93a4c81c4253a14eb413c40c79de27be')

noextract=(${_debname})

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.gz > /dev/null
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/bin
  install -m644 usr/share/applications/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -m755 usr/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -dm755 "$pkgdir"/usr/lib
  install -m644 usr/lib/libPDFNetC.so.6.5.3 "$pkgdir"/usr/lib/libPDFNetC.so.6.5.3
  ln -s ./libPDFNetC.so.6.5.3 "$pkgdir"/usr/lib/libPDFNetC.so
  install -m644 usr/lib/libbtbcore.a "$pkgdir"/usr/lib/libbtbcore.a
  install -m644 usr/lib/libbtbcoregui.a "$pkgdir"/usr/lib/libbtbcoregui.a

  cp -dpr --no-preserve=ownership usr/share/duDat "$pkgdir"/usr/share
}
