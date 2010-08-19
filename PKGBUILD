# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libots
pkgver=0.5.0
pkgrel=2
pkgdesc="Open Text Summarizer"
arch=('i686' 'x86_64')
url="http://libots.sourceforge.net/"
license=('GPL')
depends=('libxml2' 'glib2')
options=('!libtool' '!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/ots-${pkgver}.tar.gz)
md5sums=('1e140a4bf9d720b4339a5c2bdf4976e8')


build() {
  cd "${srcdir}/ots-${pkgver}"
  touch gtk-doc.make
  sed -i -e 's/en.xml$//' dic/Makefile.am
  libtoolize --force
  aclocal
  automake --add-missing --force
  autoconf
  ./configure --prefix=/usr --disable-static
  make
  make DESTDIR="${pkgdir}" install
}
