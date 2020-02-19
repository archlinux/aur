# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>
pkgname=pg_icu_ext-git
_gitname=icu_ext
pkgver=v1.5.1.r1.g444a52a
pkgrel=1
pkgdesc="PostgreSQL icu_ext package. See https://github.com/dverite/icu_ext"
arch=('i686' 'x86_64')
url="https://github.com/dverite/icu_ext"
license=('BSD')
depends=('postgresql')
builddepends=()
makedepends=(git)
options=(!emptydirs !libtool)
source=('git://github.com/dverite/icu_ext.git')
md5sums=('SKIP')

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
