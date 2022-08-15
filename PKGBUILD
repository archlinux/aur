# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=opendetex
pkgver=2.8.9
pkgrel=1
pkgdesc="Improved version of Detex - tool for extracting plain text from TeX and LaTeX sources (Piotr Kubowicz's fork)"
url="https://github.com/pkubowicz/opendetex"
arch=('i686' 'x86_64')
depends=('glibc')
license=('custom')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0d6b8cb1f3394b790dd757b0171ad8b398c48e306fa6339e86ed8303c51df084')

build () {
  cd ${srcdir}
  # lex library linking is not needed with flex
  sed -e 's/#LEX/LEX/' -i Makefile
  CC="${CC:-gcc} ${LDFLAGS}" make
}

package () {
  cd ${srcdir}
  install -D -m755 detex "${pkgdir}/usr/bin/opendetex"
  gzip -9 -c detex.1 > opendetex.1.gz
  install -D -m644 opendetex.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
