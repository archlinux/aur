# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=opendetex
pkgver=2.8.2
pkgrel=1
pkgdesc="Improved version of Detex - tool for extracting plain text from TeX and LaTeX sources"
url="https://code.google.com/archive/p/opendetex/"
arch=('i686' 'x86_64')
license=('custom')
source=("https://github.com/pkubowicz/opendetex/releases/download/v2.8.2/opendetex-2.8.2.tar.bz2")
sha256sums=('c390fa477b83a0717777b6f71d77c11a336ff9b1e3cb84116a3c19bd4ccf14f5')

build () {
  cd ${srcdir}
  # lex library linking is not needed with flex
  sed -e 's/#LEX/LEX/' -i Makefile
  make
}

package () {
  cd ${srcdir}
  install -D -m755 detex "${pkgdir}/usr/bin/opendetex"
  gzip -9 -c detex.1l > opendetex.1.gz
  install -D -m644 opendetex.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
