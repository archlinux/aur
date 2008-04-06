# $Id: PKGBUILD,v 1.10 2007/03/24 13:20:11 jgc Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributer: Ben <ben@benmazer.net>
pkgname=gtkspell
pkgver=2.0.11
pkgrel=2
url="http://gtkspell.sourceforge.net/"
pkgdesc="GtkSpell provides MSWord-style highlighting and replacement of misspelled words in a GtkText widget"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2' 'enchant')
makedepends=('pkgconfig')
options=('nolibtool')
source=(http://gtkspell.sourceforge.net/download/${pkgname}-${pkgver}.tar.gz
        gtkspell-2.0.11-enchant.patch)
md5sums=('494869f67146a12a3f17a958f51aeb05' '56272bca2bff7fda0bfe8be7ff9808b5')


build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/gtkspell-2.0.11-enchant.patch || return 1
  aclocal
  autoconf
  automake
  ./configure --prefix=/usr --disable-gtk-doc
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
