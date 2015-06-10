# Maintainer: Mingkai Dong <mingkaidong@gmail.com>

pkgname=gf-complete-git
pkgver=20141003
pkgrel=2
pkgdesc="A library implements every Galois Field multiplication technique applicable to erasure coding for storage"
arch=('i686' 'x86_64')
url="https://github.com/ceph/gf-complete"
license=('custom')
#depends=('adb' 'fuse')
makedepends=('git' 'make' 'gcc')
source=()
md5sums=()

_gitroot='https://github.com/ceph/gf-complete.git'
_gitbranch=master

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitbranch ] ; then
    cd $_gitbranch && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitbranch
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting automake..."

  cd "$srcdir/$_gitbranch"
  ./autogen.sh
  ./configure

  msg "Starting make..."

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitbranch"
  make DESTDIR="$pkgdir/" install
  rm -rf "$srcdir/$_gitbranch"
}
