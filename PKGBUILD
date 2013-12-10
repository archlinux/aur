# Contributor: furester <furester at gmail.com>

pkgname=lightmediascanner-git
pkgver=20080504
pkgrel=1
pkgdesc="Lightweight library to scan media - git version"
arch=('i686' 'x86_64')
url="http://lms.garage.maemo.org/"
license=('GPL')
conflicts=('lightmediascanner')
provides=('lightmediascanner')
makedepends=('git')
options=('!libtool')
source=()
md5sums=()

  _gitname="lightmediascanner.git"
  _gitroot="git://staff.get-e.org/users/barbieri"

build() {
  cd $startdir/src

  msg "Getting Remember sources through git..."
  if [ -d $startdir/src/$_gitname/.git ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot/$_gitname $_gitname
  fi

  cd $startdir/src/$_gitname/

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install

}

