pkgname=liblmdb-git
_gitname=lmdb
_source_path=$_gitname/libraries/liblmdb
pkgver=91fc43f
pkgrel=1
pkgdesc='Symas Lightning Memory-Mapped Database'
arch=(any)
license=(custom)
makedepends=(git)
provides=(liblmdb)
depends=()
conflicts=(liblmdb mdb-git)
source=("git://github.com/LMDB/lmdb.git")
url=http://symas.com/mdb/
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

build() {
  cd $_source_path
  make
}

package() {
  cd $_source_path
  ## custom install because make with DESTDIR seems not to work
  mkdir -p ${pkgdir}/usr/{bin,lib,include}
  cp mdb_stat mdb_copy mdb_dump mdb_load  ${pkgdir}/usr/bin
  cp liblmdb.a liblmdb.so ${pkgdir}/usr/lib
  cp lmdb.h ${pkgdir}/usr/include
}
