# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=2.3.16
pkgrel=1
pkgdesc="LaTeX to RTF converter"
arch=('x86_64')
url="http://latex2rtf.sourceforge.net/"
license=('GPL')
depends=('glibc' 'imagemagick' 'ghostscript')
makedepends=('texinfo' 'texlive-bin' 'texlive-plainextra')
checkdepends=('texlive-latexextra') # for a4wide package
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('79aff771ee014300606560f18fde74c9eb3a250d')
md5sums=('a7e705af414753c01b04ff15bf4c0af6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=/usr latex2rtf
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's,s/\\\\,s/\\\\\\,' test/bracecheck
  chmod u+x test/bracecheck
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr" install install-info
  chmod 755 "${pkgdir}/usr/bin/latex2png"
  sed -i -e 's|error "no input file specified"| echo "error: no input file specified"|' "${pkgdir}/usr/bin/latex2png"
}
