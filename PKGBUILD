# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=powa-archivist-git
_gitname=powa-archivist
pkgver=.3.1.2.r2.g27cdad3
pkgrel=1
pkgdesc="postgresql background worker to capture data"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/powa-team/powa-archivist"
license=('BSD')
depends=('postgresql')
optdepends=('pg_qualstats-git: capture predicate statistics in PostgreSQL'
           'pg_stat_kcache-git: capture system cache hit ratio in PostgreSQL'
	   'hypopg-git: create hypothetical indexes in PostgreSQL to test for plan changes')
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git+https://github.com/powa-team/powa-archivist.git')
md5sums=('SKIP')
install='powa-archivist-git.install'

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/REL//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
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
