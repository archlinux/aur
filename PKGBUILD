# Maintainer: Brian Bidulock <bidulock@openss7.org

pkgname=bbdock-git
_pkgname=bbdock
pkgver=r8.07fcb34
pkgrel=1
epoch=1
pkgdesc="An application launcher dockapp supporting PNG files and transparency"
arch=('i686' 'x86_64')
url="https://github.com/markusfisch/$_pkgname"
license=('LGPL3')
depends=('libx11' 'libpng')
makedepends=('libxt' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git://github.com/markusfisch/$_pkgname.git"
	"$_pkgname.patch")
md5sums=('SKIP'
         '5568359bb94d3bf6c8777b75e255fa3f')

pkgver () {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd $pkgname
  patch -Np2 -b -z .orig <../$_pkgname.patch
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make clean
  make
}
  
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm655 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
