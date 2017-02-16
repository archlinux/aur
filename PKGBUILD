# Maintainer: Dikiy <dikiy_evrej[at]web[dot]de>
pkgname=emkatic
pkgver=0.29
pkgrel=1
pkgdesc="Emulator of modern Russian RPN programmable calculators MK-152, MK-161 series (the successor of MK-52,MK-61)"
url="https://sourceforge.net/projects/emkatic/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
makedepends=('lazarus' 'fpc')
conflicts=()
replaces=()
backup=()
#install=''
source=(https://sourceforge.net/projects/emkatic/files/eMKatic%20Source/$pkgname-$pkgver-src.tar.gz)
md5sums=('b6d1c3926ac4847f56e85a327e501519')

build() {

  cd "${srcdir}/$pkgname-$pkgver-src"
  patch -p1 < ../../unanchor.patch

  lazbuild --bm=Release emkatic.lpi
}

package() {
  cd "${srcdir}/$pkgname-$pkgver-src"
  mkdir -p "$pkgdir/usr/share/doc/emkatic"
  install -Dm644 *.txt "$pkgdir/usr/share/doc/emkatic"

  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  install -Dm644 "emkatic.ico"  "$pkgdir/usr/share/icons/hicolor/128x128/apps/"

  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "emkatic.linux-i386" "$pkgdir/usr/bin/"
  
  cat > emkatic.sh <<EOF
#!/bin/bash

emkatic.linux-i386 -p
EOF
  
  install -Dm755 "emkatic.sh" "$pkgdir/usr/bin/emkatic"
}

# vim:set ts=2 sw=2 et:
