# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=2.3.8
pkgrel=1
pkgdesc="LaTeX to RTF converter"
arch=('i686' 'x86_64')
url="http://latex2rtf.sourceforge.net/"
license=('GPL')
depends=('glibc' 'imagemagick' 'ghostscript')
makedepends=('texinfo' 'texlive-bin' 'texlive-plainextra')
checkdepends=('texlive-latexextra') # for a4wide package
install=latex2rtf.install
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "texinfo-5-fix.patch")
sha1sums=('334de546342078c7a3213cb5b554a0a900952641'
          'e5f2020004ba2aa428eabdce07f4a68ea11f3882')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/texinfo-5-fix.patch"
}

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
