# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=pg_qualstats-git
_gitname=pg_qualstats
pkgver=2.0.4.1.r6.g66b3037
pkgrel=1
pkgdesc="Capture qualifiers the same way as pg_stat_statement does for statements"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/powa-team/pg_qualstats"
license=('BSD')
depends=('postgresql')
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git+https://github.com/powa-team/pg_qualstats.git')
md5sums=('SKIP')
install='pg_qualstats-git.install'

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/.*\///;s/REL//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
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
