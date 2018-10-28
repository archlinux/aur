# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=opendetex
pkgver=2.8.4
pkgrel=1
pkgdesc="Improved version of Detex - tool for extracting plain text from TeX and LaTeX sources (Piotr Kubowicz's fork)"
url="https://github.com/pkubowicz/opendetex"
arch=('i686' 'x86_64')
depends=('glibc')
license=('custom')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d3836f2bdd5ef9c80abc163bf8d91ab7ec59cf269a33c0d09165b4a27584765f')

build () {
  cd ${srcdir}
  # lex library linking is not needed with flex
  sed -e 's/#LEX/LEX/' -i Makefile
  CC="${CC:-gcc} ${LDFLAGS}" make
}

package () {
  cd ${srcdir}
  install -D -m755 detex "${pkgdir}/usr/bin/opendetex"
  gzip -9 -c detex.1l > opendetex.1.gz
  install -D -m644 opendetex.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
