# Maintainer:  bug <bug2000@gmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: scj <scj archlinux us>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com

pkgname=4th
pkgver=3.64.1
pkgrel=1
pkgdesc="A Forth Compiler"
arch=('i686' 'x86_64')
url="http://www.xs4all.nl/~thebeez/4tH/index.html"
license=('LGPL')
source=("4th-${pkgver}-unix.tar.gz::http://sourceforge.net/projects/forth-4th/files/4th-${pkgver}/4th-${pkgver}-unix.tar.gz/download")
sha256sums=('f96ea74cdb2aadfdc3bebf8d6d2cf7b8976b5d56c1237387479bffaecede9fe3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/sources/"
  sed -i 's/txt/pdf/' Makefile
  sed -i '\#/4th/#a\\	install -Dm644 ../documentation/pp4th.1 $(MANDIR)/man1/pp4th.1' Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/sources/"
  install -D -m644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -d "${pkgdir}/usr/"{share/doc/4th,lib,bin}
  make BINARIES="${pkgdir}/usr/bin" \
       LIBRARIES="${pkgdir}/usr/lib" \
       DOCDIR="${pkgdir}/usr/share/doc" \
       MANDIR="${pkgdir}/usr/share/man" install
}
