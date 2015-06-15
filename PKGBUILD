# Contributer: Felix Yan <felixonmars@gmail.com>
# Maintainer: Star Brilliant <m13253@hotmail.com>

pkgname=lwqq-git
_gitname=lwqq
pkgver=0
pkgrel=1
pkgdesc="A library for webqq protocol"
arch=('i686' 'x86_64')
url="https://github.com/xiehuc/lwqq"
license=('GPL3')
depends=('curl' 'libev' 'js17' 'sqlite')
provides=('lwqq')
conflicts=('lwqq')
makedepends=('git' 'cmake')
source=($_gitname::"git://github.com/xiehuc/lwqq.git")

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | cut -c 2- | sed 's|-|.|g'
}

build() {
  cd $_gitname
  
  sed -e 's/set(LIBSUFFIX "64")/set(LIBSUFFIX "")/' \
      -i CMakeLists.txt
      
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}

sha512sums=('SKIP')
