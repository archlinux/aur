# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=maliit-framework
pkgname=$_pkgname-git
pkgver=20120704
pkgrel=1
pkgdesc="Maliit Input Methods - Framework"
arch=('x86_64' 'i686')
url="http://maliit.org"
license=('LGPL')
depends=('qt')
install=${_pkgname}.install
conflicts=($_pkgname)
provides=($_pkgname)
source=()
md5sums=()

_gitroot="git://gitorious.org/maliit/maliit-framework.git"
_gitname="$_pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # BUILD
  qmake -r . CONFIG+=notests
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make install INSTALL_ROOT="$pkgdir/"
} 
