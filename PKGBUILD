# Maintainer: Mikołaj Milej <mikolajmm+archlinuxaur@gmail.com>

pkgname=ydpd-git
pkgver=0.5.1
pkgrel=1
pkgdesc="A front-end to YDP Collins Dictionary written in Qt4"
arch=('i686' 'x86_64')
url="https://github.com/travnick/ydpd"
license=('GPL')
depends=('qt4' 'libydpdict')
makedepends=('git')
options=('strip')
source=(git://github.com/travnick/ydpd.git)
md5sums=('SKIP')
_gitname=ydpd
_binname=ydpd

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|v||g'
}

build() {
  mkdir "$srcdir/build" -p
  rm "$srcdir/build/*" -fr
  cd "$srcdir/build"
  
  qmake-qt4 -config release ../$_gitname

  make
}

package() {
  cd "$srcdir/build"

  install -D -m755 $_binname $pkgdir/usr/bin/$_binname || return 1
}

