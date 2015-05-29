# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="tagsistant-svn"
_pkgname="tagsistant"
pkgver="462"
pkgrel="1"
pkgdesc="Semantic File System for Linux kernels"
url="https://www.tagsistant.net/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('subversion')
depends=('fuse' 'libdbi' 'libdbi-drivers' 'sqlite2' 'sqlite' 'libmariadbclient' 'postgresql-libs' 'glib2' 'libextractor')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="tagsistant.install"
changelog="ChangeLog"
source=("${_pkgname}::svn+http://svn.gna.org/svn/tagfs/trunk")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}/"

  svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}/${_pkgname}/"

  autoreconf -vfi
  ./configure --prefix=/usr --datarootdir="${pkgdir}/usr/share/"
  make
}

package() {
  cd "${srcdir}/${_pkgname}/"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=4 sw=4 et:
