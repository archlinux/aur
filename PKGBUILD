# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=blktap-git
pkgver=20130311
pkgrel=1
pkgdesc="Blktap Userspace Tools + Library"
arch=('i686' 'x86_64')
url="http://github.com/xen-org/blktap"
license=('GPL')
makedepends=('git')
md5sums=('SKIP')
_gitroot="https://github.com/xen-org/blktap.git"
_gitname="blktap"

build() {
  cd "$srcdir"

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
  else
    git clone "$_gitroot" "$_gitname"
  fi

  cd "$srcdir"
  rm -rf build
  git clone "$_gitname" build
  cd "$srcdir/build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
