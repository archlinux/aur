# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=apfsprogs
pkgname=$_pkgname-git
pkgver=r345.5efac5a
pkgrel=1
pkgdesc='Experimental APFS tools for linux'
arch=(x86_64)
license=(GPL2)
url='https://github.com/eafer/apfsprogs'
depends=('glibc')
makedepends=('git')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=('git+https://github.com/eafer/apfsprogs')
sha256sums=('SKIP')

_progs=(apfsck mkapfs)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  make -C lib
  for prog in "${_progs[@]}" ; do
    make -C $prog
  done
}

package() {
  cd $_pkgname

  for prog in "${_progs[@]}" ; do
    make -C $prog install DESTDIR="$pkgdir" BINDIR=/usr/bin MANDIR=/usr/share/man/man8
  done
}
