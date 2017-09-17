# Maintainer: joho1001 (Josef Hopfgartner) <josef at netzagentur dot at>
pkgname=pg_partman-git
_gitname=pg_partman
pkgver=61026e7
pkgrel=1
pkgdesc="postgresql partition manager background worker"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/keithf4/pg_partman"
license=('BSD')
depends=('postgresql')
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git://github.com/keithf4/pg_partman.git')
md5sums=('SKIP')
install='pg_partman-git.install'

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
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR=$pkgdir install
}
