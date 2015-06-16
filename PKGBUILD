# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=deadbeef-plugins-dvar-svn
_pkgname=deadbeef_vfs_archive_reader
pkgver=8
pkgrel=4
pkgdesc="ddb vfs archive reader plugin for deadbeef, provides gzip, 7z and rar support"
arch=('i686' 'x86_64')
url="https://www.assembla.com/code/deadbeef_vfs_archive_reader/subversion/nodes"
license=('GPL')
license=('GPL')
depends=('deadbeef')
makedepends=('subversion')
source=("$_pkgname::svn+https://subversion.assembla.com/svn/$_pkgname/trunk/src")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/$_pkgname"

  LC_ALL=C svn info | awk '/Last Changed Rev/ {print $4}'
}

build() {
  cd "$srcdir/$_pkgname"

  #.rsn support?
  sed -i '/strcasecmp/s/||/|| !strcasecmp (ext, ".rsn") ||/' ./vfs_archive_reader.c

  make
}

package() {
  mkdir -p "${pkgdir}/usr/lib/deadbeef"
  cp "${srcdir}/$_pkgname/ddb_archive_reader.so" "${pkgdir}/usr/lib/deadbeef/"
}
