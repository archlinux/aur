# Maintainer: josephgbr <rafaele.f.f1@gmail.com>

pkgname=direvent-git
pkgver=5.0.r114.5259b13
pkgrel=1
pkgdesc="Daemon that monitors events in the file system directories"
arch=('i686' 'x86_64')
url="http://www.gnu.org.ua/software/direvent/"
license=("GPL")
depends=('glibc')
makedepends=('git')
install=$pkgname.install
source=(git://git.savannah.gnu.org/direvent.git)
md5sums=('SKIP')

pkgver() {
  cd direvent
    
  v=`grep AC_INIT configure.ac | cut -d[ -f3 | cut -d] -f1` # get version
  r=`git rev-list --count HEAD` # get git revision
  h=`git rev-parse --short HEAD` # get sha1's short output
  printf "$v.r$r.$h"
}

build() {
  cd direvent
  ./bootstrap
  ./configure --prefix=/usr
  make
}

check() {
  cd direvent
  make check
}

package() {
  cd direvent
  make DESTDIR="$pkgdir/" install
}
