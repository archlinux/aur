# Maintainer: M0Rf30

pkgname=cocoon-git
pkgver=1144.5c2ba08
pkgrel=1
pkgdesc="A GUI for Git"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/sdk/cocoon"
license=('LGPL')
depends=('kdebase-runtime')
makedepends=('git' 'automoc4' 'cmake')
replaces=('cocoon')
install=${pkgname}.install
source="cocoon::git://anongit.kde.org/cocoon"

build() {
  cd cocoon
  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release 
  make
}  

package(){
  cd cocoon	
  make DESTDIR=$pkgdir install
  rm -rf "$srcdir/$_gitname-build"
} 

pkgver() {
  cd cocoon
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
