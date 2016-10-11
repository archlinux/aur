# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: scj <scj archlinux us>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com

pkgname=4th
pkgver=3.62.4
pkgrel=1
pkgdesc="A Forth Compiler"
arch=('i686' 'x86_64')
url="http://www.xs4all.nl/~thebeez/4tH/index.html"
license=('LGPL')
source=("4th-${pkgver}-unix.tar.gz::http://sourceforge.net/projects/forth-4th/files/4th-${pkgver}/4th-${pkgver}-unix.tar.gz/download")
sha256sums=('1c7adbb1a56dad4c4c781e6e023d77ac862842560c05246b691d07e9a4460ab2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-unix/sources/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-unix/sources/"
	install -D -m644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -d "${pkgdir}/usr/"{share/doc/4th,lib,bin}
  make BINARIES="${pkgdir}/usr/bin" \
       LIBRARIES="${pkgdir}/usr/lib" \
       DOCDIR="${pkgdir}/usr/share/doc" \
       MANDIR="${pkgdir}/usr/share/man" install
}
