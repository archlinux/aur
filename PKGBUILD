# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=pgformatter-git
_gitname=pgformatter
pkgver=1e65db3
pkgrel=1
pkgdesc="Correctly indent PostgreSQL queries"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dalibo/pgformatter"
license=('BSD')
depends=()
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git://github.com/darold/pgformatter.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  tag=`git tag | grep REL | tail -1`
  commit=`git log --format="%h" -n 1`
  echo "$tag_$commit"
}

build() {
  local _gitdir=$srcdir/$_gitname
  cd $_gitdir
  git clean -dfx
  git reset --hard
  perl Makefile.PL
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR=$pkgdir install
}
