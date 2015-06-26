# Maintainer: Benoit Favre <benoit.favre@gmail.com>
pkgname=tbb-boost-git
pkgver=20110215
pkgrel=1
pkgdesc="Parallel implementation of boostexter's scored text classifier"
arch=(i686 x86_64)
url="http://github.com/benob/tbb-boost"
license=('GPL')
depends=('intel-tbb')
makedepends=('git' 'gcc>=4.4')
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/benob/tbb-boost.git"
_gitname="tbb-boost"

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

  #
  # BUILD HERE
  #

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d $pkgdir/usr/bin/
  install tbb-train tbb-predict $pkgdir/usr/bin/
} 
