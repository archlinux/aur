# Contributor: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sawfish-pager-git
pkgver=0.90.4.1.gfdc0976
pkgrel=1
pkgdesc='A pager for the git-version of sawfish'
arch=('i686' 'x86_64')
url='http://sawfish.wikia.com'
license=('GPL')
depends=('sawfish-git')
makedepends=('git' 'rep-gtk-git' 'gettext')
provides=('sawfish-pager')
conflicts=('sawfish-pager')
options=('!libtool')
source=(git://github.com/SawfishWM/sawfish-pager.git)
md5sums=('SKIP')
_gitname='sawfish-pager'

pkgver() {
  cd $_gitname
  # Git tag
  echo $(git describe --tags|sed 's/-/./g'|cut -c15-)
}

build() {
  cd $srcdir/$_gitname
  ./autogen.sh 
  ./configure --prefix=/usr 
  make 
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir" install 
} 
