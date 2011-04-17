# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=2.1.0
pkgrel=1
pkgdesc="LaTeX to RTF converter"
arch=('i686' 'x86_64')
url="http://latex2rtf.sourceforge.net/"
license=('GPL')
depends=('glibc' 'imagemagick' 'ghostscript')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('31e6280312b56c2c38cf6a3fddff21a9910c7d6f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=${pkgdir}/usr MAN_INSTALL=${pkgdir}/usr/share/man/man1 install
  sed -i -e 's|error "no input file specified"| echo "error: no input file specified"|' ${pkgdir}/usr/bin/latex2png
}
