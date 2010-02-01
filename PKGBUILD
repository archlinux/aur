# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=2.0.0
pkgrel=1
pkgdesc="LaTeX to RTF converter"
arch=('i686' 'x86_64')
url="http://latex2rtf.sourceforge.net/"
license=('GPL')
depends=('glibc' 'imagemagick' 'ghostscript')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('39611b6dbb5ce78b48c7695f3fcafb88')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr || return 1
  make PREFIX=${pkgdir}/usr MAN_INSTALL=${pkgdir}/usr/share/man/man1 install || return 1
  sed -i -e 's|error "no input file specified"| echo "error: no input file specified"|' ${pkgdir}/usr/bin/latex2png
}
