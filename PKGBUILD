# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=2.2.1c
pkgrel=1
pkgdesc="LaTeX to RTF converter"
arch=('i686' 'x86_64')
url="http://latex2rtf.sourceforge.net/"
license=('GPL')
depends=('glibc' 'imagemagick' 'ghostscript')
checkdepends=(
  'texlive-bin'
  'texlive-core'
  'texlive-latexextra' # for a4wide package
)
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('3fd5874de8988cf45f8862d2b3db8ed13a04caa4')

build() {
  cd "${srcdir}/${pkgname}-2.2.1"
  make
}

check() {
  cd "${srcdir}/${pkgname}-2.2.1"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-2.2.1"
  make DESTDIR=${pkgdir}/usr install
  sed -i -e 's|error "no input file specified"| echo "error: no input file specified"|' ${pkgdir}/usr/bin/latex2png
}
