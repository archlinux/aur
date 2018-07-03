# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=booktab
pkgver=4.0
pkgrel=6
pkgdesc="MyZanichelli - La piattaforma che ti permette di consultare tutti i tuoi libri scolastici in versione multimediale e interattiva."
arch=('x86_64')
url="https://booktab.it/"
license=('unknown')
depends=("fontconfig" "libxrandr" "libxdamage" "libcups" "nss" "libpng12" "icu55" "libxcursor" "libxinerama" "gstreamer0.10-base" "libpulse" "qt5-svg" "qt5-webkit")

_debname=BooktabZSetup.deb

source=(https://booktab.it/setup-z/${_debname} booktab.desktop booktab_launcher)
md5sums=('1672cd7af08028fea1dfc1e57ee1854f'
         '9d8fcee082b5011aeb0234fca6d02fda'
         'aacc6b709717c15a8437fced7a351c8d')

noextract=(${_debname})

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/bin
  # install -m644 usr/share/applications/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # install -m644 usr/share/applications/"$pkgname"z.desktop "$pkgdir"/usr/share/applications/"$pkgname"z.desktop
  install -m755 usr/bin/booktab "$pkgdir"/usr/bin/booktab

  install -m644 booktab.desktop "$pkgdir"/usr/share/applications/booktab.desktop
  install -m755 booktab_launcher "$pkgdir"/usr/bin/booktab_launcher

  install -dm755 "$pkgdir"/usr/lib
  install -m644 usr/lib/libPDFNetC.so.6.5.3 "$pkgdir"/usr/lib/libPDFNetC.so.6.5.3
  ln -s ./libPDFNetC.so.6.5.3 "$pkgdir"/usr/lib/libPDFNetC.so
  install -m644 usr/lib/libbtbanalytics.a "$pkgdir"/usr/lib/libbtbanalytics.a
  install -m644 usr/lib/libbtbcore.a "$pkgdir"/usr/lib/libbtbcore.a
  install -m644 usr/lib/libbtbcoregui.a "$pkgdir"/usr/lib/libbtbcoregui.a

  ln -s /usr/lib/libpcre16.so "$pkgdir"/usr/lib/libpcre16.so.3

  cp -dpr --no-preserve=ownership usr/share/duDat "$pkgdir"/usr/share
}
