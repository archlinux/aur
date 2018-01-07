# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>

pkgname=synce-libmimedir
pkgver=0.4
pkgrel=8
pkgdesc="provide a means of communication with a Windows CE device - library that parses MIME Directory Profile."
arch=('x86_64')
url="http://synce.sourceforge.net/"
license=('GPL')
options=('staticlibs')
source=(https://downloads.sourceforge.net/sourceforge/synce/libmimedir-$pkgver.tar.gz)
sha256sums=('8d721bdc83739bcebea286c41e67495fe7258c00db32fba3928071f0ea30b096')

build() {
  cd "$srcdir"/libmimedir-$pkgver
  if [ "$CARCH" = "x86_64" ]; then
    sed -i -e 's|Wall|Wall -fPIC -DPIC|g' Makefile.in
    ./configure --prefix=/usr --with-pic
  else
    ./configure --prefix=/usr
  fi
  make
}

package() {
  cd "$srcdir"/libmimedir-$pkgver
  mkdir -p "$pkgdir"/usr/{include,lib}
  make prefix="$pkgdir"/usr install
}
