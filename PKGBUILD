# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=pg_stat_kcache-git
_gitname=pg_stat_kcache
pkgver=2.1.0.r1.g6bedab2
pkgrel=1
pkgdesc="Get kernel statistics for sessions in PostgreSQL. Be able to measure the real hit ratio !"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/powa-team/pg_stat_kcache"
license=('BSD')
depends=('postgresql')
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git+https://github.com/powa-team/pg_stat_kcache.git')
md5sums=('SKIP')
install='pg_stat_kcache-git.install'

pkgver() {
   cd $_gitname
   git describe --long --tags | sed 's/REL//;s|debian/||;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
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
