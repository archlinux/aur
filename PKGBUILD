pkgname=liblmdb-git
_gitname=lmdb
_source_path=$_gitname/libraries/liblmdb
pkgver=1085
pkgrel=1
pkgdesc="Symas Lightning Memory-Mapped Database"
arch=(any)
license=(custom)
makedepends=(git)
provides=(liblmdb lmdb)
depends=()
conflicts=(liblmdb mdb-git lmdb)
source=("git://github.com/LMDB/lmdb.git")
url=http://symas.com/mdb/
md5sums=(SKIP)

pkgver() {
  cd $_source_path
  git rev-list --count HEAD
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
