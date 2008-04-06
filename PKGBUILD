# $Id: PKGBUILD,v 1.1 2005/11/08 09:43:36 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libots
pkgver=0.4.2
pkgrel=1
pkgdesc="Open Text Summarizer"
url="http://libots.sourceforge.net/"
license="GPL"
depends=('libxml2' 'glib2' 'popt')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/ots-${pkgver}.tar.gz
        gcc4.patch)
md5sums=('bb02a56a3bf2d5ebf9ffd064992d0ae4' 'bbb6ab67f37fb6193ec9cf204b4d5d5a')

build() {
  cd ${startdir}/src/ots-${pkgver}
  patch -Np1 -i ${startdir}/src/gcc4.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  #libtoolslay
  find ${startdir}/pkg -name '*.la' -exec rm {} \;
}
