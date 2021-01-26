# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=hypopg-git
_gitname=hypopg
pkgver=1.1.4.r10.g1196869
pkgrel=1
pkgdesc="Hypothetical indexes for PostgreSQL... ask the optimizer if this hypothetical index would help"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/HypoPG/hypopg"
license=('BSD')
depends=('postgresql')
builddepends=()
makedepends=(git)
provides=(hypopg)
conflicts=(hypopg)
options=(!emptydirs !libtool)
source=('git+https://github.com/HypoPG/hypopg.git')
md5sums=('SKIP')
install='hypopg-git.install'

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
