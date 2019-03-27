# Maintainer:
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=auctex
pkgver=12.1
pkgrel=1
pkgdesc="An extensible package for writing and formatting TeX files in Emacs"
arch=('any')
url="http://www.gnu.org/software/auctex/"
license=('GPL3')
depends=('emacs' 'ghostscript' 'texlive-core')
options=('!makeflags')
install=auctex.install
source=(https://ftp.gnu.org/pub/gnu/auctex/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('7744738f59fbb0862edb89eb2d47920b0f94c18b'
          'SKIP')
validpgpkeys=('70CDE487C45540307F86972BE2FD58BF20485F50')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's/as_fn_error $? "--with-texmf-dir=/echo as_fn_error $? "--with-texmf-dir=/' configure
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --localstatedir=/var --with-texmf-dir=/usr/share/texmf
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
