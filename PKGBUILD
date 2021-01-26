# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=plpgsql_check-git
pkgbase=plpgsql_check
_gitname=plpgsql_check
pkgver=1.8.2.5.g5bd23ea
pkgrel=1
epoch=2
pkgdesc="linter for PostgreSQL's procedural language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/okbob/plpgsql_check"
license=('Postcardware')
depends=('postgresql')
builddepends=()
makedepends=(git llvm)
options=(!emptydirs !libtool)
source=('git+https://github.com/okbob/plpgsql_check')
md5sums=('SKIP')
install=''

pkgver() {
  cd $_gitname
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
  echo "$tag_$commit"
}

build() {
  local _gitdir=$srcdir/$_gitname
  cd $_gitdir
  git clean -dfx
  git reset --hard
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR=$pkgdir install
}
