# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=hypopg-git
_gitname=hypopg
pkgver=b78049e
pkgrel=1
pkgdesc="postgresql background worker to capture data"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/dalibo/hypopg"
license=('BSD')
depends=('postgresql')
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git://github.com/dalibo/hypopg.git')
md5sums=('SKIP')
install='hypopg-git.install'

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
