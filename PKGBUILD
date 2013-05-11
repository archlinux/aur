# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=2.3.3
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
install=latex2rtf.install
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('85dd36e8595f92f41b0b173a6b42279333bbb1a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=/usr
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr" install install-info
  sed -i -e 's|error "no input file specified"| echo "error: no input file specified"|' "${pkgdir}/usr/bin/latex2png"
}
