# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jon Ribeiro <contact@jonathas.com>
pkgname=dbf
pkgver=0.9.0
pkgrel=4
pkgdesc="Command line tool to show and convert the content of dBASE III, IV, and 5.0 files"
url="http://sourceforge.net/projects/dbf"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libdbf')
makedepends=('unzip')
source=(http://ftp.mirrorservice.org/sites/download.sourceforge.net/pub/sourceforge/d/db/dbf.berlios/dbf-core-0.9.0.src.zip)
source=(dbf-core-0.9.0.src.zip::https://sourceforge.net/projects/dbf/files/dbf%20-%20dBASE%20Reader/dbf-0.9.0/dbf-core-0.9.0.src.zip/download)
md5sums=('fb5c016d9e45a95c1956d959792a5063')

build() {
  cd "${srcdir}/$pkgname-core"
  rm -f configure install-sh depcomp missing
  sed -r -i 's,AM_GLIB_GNU_GETTEXT,AM_GNU_GETTEXT_VERSION([0.19.8])\nAM_GNU_GETTEXT([external]),' configure.in
  mv configure.in configure.ac
  autoreconf -fiv
  intltoolize --copy --force
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-core"
  make DESTDIR="${pkgdir}" install
}
