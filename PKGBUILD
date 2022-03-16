# Contributor: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sawfish-pager-git
pkgver=0.90.4.7.g42591a2
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
source=(git+https://github.com/SawfishWM/sawfish-pager.git)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  # Git tag
  echo $(git describe --tags|sed 's/-/./g'|cut -c15-)
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh 
  ./configure --prefix=/usr 
  make 
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install 
} 
