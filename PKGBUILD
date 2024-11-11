# Maintainer:  Cam Webb <cw@camwebb.info>
# Contributor: Daniel Biehl <dbiehl@live.de>
# Contributor: Daniël de Kok <me@danieldk.eu>
# Contributor: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=xqilla
pkgver=2.3.4
pkgrel=4
pkgdesc="An XQuery and XPath 2.0 library, written in C++ and built on top of Xerces-C."
arch=("x86_64")
url="http://xqilla.sourceforge.net/"
license=("GPL3")
depends=("xerces-c" "icu" "clang")

source=("https://downloads.sourceforge.net/project/xqilla/XQilla-${pkgver}.tar.gz")
sha256sums=('292631791631fe2e7eb9727377335063a48f12611d641d0296697e0c075902eb')            

prepare() {
  cd "XQilla-${pkgver}"
}

build() {
  cd "XQilla-${pkgver}"
  LIBS=-lstdc++ CFLAGS="" CC=clang CCX=clang CXXFLAGS=-std=c++11 ./configure --prefix=/usr --with-xerces=/usr
  make
}

package() {
  cd "XQilla-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
