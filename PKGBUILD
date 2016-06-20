# Maintainer: Marco44 <cousinmarc at gmail dot com>
pkgname=pldebugger-git
_gitname=pldebugger
pkgver=REL.9_5_0.r2.g14c6caf
pkgrel=1
pkgdesc="PL/pgSQL debugger server-side code"
arch=('i686' 'x86_64')
url=https://git.postgresql.org/gitweb/?p=pldebugger.git
license=('GPL3')
depends=('libpcap' 'libjpeg' 'libpng12' 'giflib')
builddepends=('postgresql-libs')
makedepends=(git autoconf)
options=(!emptydirs !libtool)
source=('git://git.postgresql.org/git/pldebugger.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _gitdir=$srcdir/$_gitname
  cd $_gitdir
  git clean -dfx
  git reset --hard
  USE_PGXS=1 make
}

package() {
  cd $srcdir/$_gitname
  USE_PGXS=1 make DESTDIR="$pkgdir/" install
}
