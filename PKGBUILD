# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=opendetex
pkgver=2.8.1
pkgrel=1
pkgdesc="Improved version of Detex - tool for extracting plain text from TeX and LaTeX sources"
url="https://code.google.com/archive/p/opendetex/"
arch=('i686' 'x86_64')
license=('custom')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/opendetex/opendetex-2.8.1.tar.bz2")
sha256sums=('8a47e4c7052672dfe5e0a4214dd5db42ac4322eb382efe6fd1fb271b409d051e')

build () {
  cd ${srcdir}/${pkgname}
  # lex library linking is not needed with flex
  sed -e 's/#LEX/LEX/' -i Makefile
  make
}

package () {
  cd ${srcdir}/${pkgname}
  install -D -m755 detex "${pkgdir}/usr/bin/opendetex"
  gzip -9 -c detex.1l > opendetex.1.gz
  install -D -m644 opendetex.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
