# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libots
pkgver=0.5.0
pkgrel=5
pkgdesc='Open Text Summarizer'
url='https://libots.sourceforge.net/'
arch=('x86_64')
license=('GPL')
depends=('libxml2' 'glib2' 'popt')
source=("https://sources.archlinux.org/other/packages/libots/ots-$pkgver.tar.gz")
sha1sums=('4468bc06470734848c2369a37c84f76ca4ac3f9a')

prepare() {
  cd ots-${pkgver}
  touch gtk-doc.make
  sed 's/en.xml$//' -i dic/Makefile.am
  libtoolize --force
  aclocal
  automake --add-missing --force
  autoconf
}

build() {
  cd ots-${pkgver}
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd ots-${pkgver}
  make DESTDIR="${pkgdir}" install
}
