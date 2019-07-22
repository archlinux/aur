# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=pgformatter-git
_gitname=pgformatter
pkgver=v4.0.r19.gd6e919b
pkgrel=1
pkgdesc="Correctly indent PostgreSQL queries"
arch=('i686' 'x86_64')
url="https://github.com/darold/pgformatter"
license=('BSD')
depends=()
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git://github.com/darold/pgformatter.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
