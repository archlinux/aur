# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: shild <sxp@bk.ru>

pkgname=centerim
pkgver=4.22.10
pkgrel=7
pkgdesc="Fork of CenterICQ - A text mode menu- and window-driven IM interface"
arch=('x86_64')
url="http://www.centerim.org"
license=('GPL')
depends=('python2' 'libjpeg' 'gpgme')
replaces=('centericq')
source=(http://www.centerim.org/download/releases/$pkgname-$pkgver.tar.gz)
md5sums=('7565c3c8cac98a4e2d8524076a44676f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's#python#python2#' misc/CenterIMLog2HTML.py
  sed -i '1,1i#include <stdio.h>' libicq2000/libicq2000/sigslot.h
  export CXXFLAGS+=' -std=gnu++98'
  ./configure --prefix=/usr \
              --with-ssl \
              --with-openssl \
              --enable-locales-fix
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
