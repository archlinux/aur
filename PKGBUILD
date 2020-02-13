# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname=dbf
pkgver=0.9.0
pkgrel=3
pkgdesc="Command line tool to show and convert the content of dBASE III, IV, and 5.0 files"
url="http://sourceforge.net/projects/dbf"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libdbf')
makedepends=('unzip')
source=(https://downloads.sourceforge.net/project/dbf/dbf%20-%20dBASE%20Reader/dbf-0.9.0/dbf-core-0.9.0.src.zip)
sha512sums=('f22a81038b44b9d8004c1ec058d00326dca76ee835718358faf15da91ed2716d6d77c2841cd8fb682791f59c6156be157bf02c448b0348fb4e98ebb6826b165a')

build() {
  cd "${srcdir}/$pkgname-core"
  chmod +x autogen.sh
  rm configure install-sh depcomp missing
  ./autogen.sh && ./configure --prefix=/usr
  make || return 1
}

package() {
	cd "${srcdir}/$pkgname-core"
	make DESTDIR="${pkgdir}" install
	find "${pkgdir}" -name '*.la' -exec rm {} \;
}
