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
source=(http://ftp.mirrorservice.org/sites/download.sourceforge.net/pub/sourceforge/d/db/dbf.berlios/dbf-core-0.9.0.src.zip)
md5sums=('fb5c016d9e45a95c1956d959792a5063')

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
