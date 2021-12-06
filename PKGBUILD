# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=pgformatter-git
_gitname=pgformatter
pkgver=v5.2.r0.gfe95448
pkgrel=1
pkgdesc="Correctly indent PostgreSQL queries"
arch=('i686' 'x86_64')
url="https://github.com/darold/pgformatter"
license=('BSD')
depends=()
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git+https://github.com/darold/pgformatter.git')
provides=("pgformatter-git")
conflicts=("pgformatter")
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
